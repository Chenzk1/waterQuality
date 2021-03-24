import socket
import sys
import threading
import json
import numpy as np
import copy
import datetime
# from tag import train2
# # nn=network.getNetWork()
# # cnn = conv.main(False)
# # 深度学习训练的神经网络,使用TensorFlow训练的神经网络模型，保存在文件中
# nnservice = train2.NNService(model='model/20180731.ckpt-1000')
def main():
    # 创建服务器套接字
    serversocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    # 获取本地主机名称
    host = socket.gethostname()
    # 设置一个端口
    port = 9528
    # 将套接字与本地主机和端口绑定
    serversocket.bind((host,port))
    # 设置监听最大连接数
    serversocket.listen(5)
    # 获取本地服务器的连接信息
    myaddr = serversocket.getsockname()
    print("服务器地址:%s"%str(myaddr))
    # 循环等待接受客户端信息
    while True:
        # 获取一个客户端连接
        clientsocket,addr = serversocket.accept()
        print("连接地址:%s" % str(addr))
        try:
            t = ServerThreading(clientsocket)#为每一个请求开启一个处理线程
            t.start()
            pass
        except Exception as identifier:
            print(identifier)
            pass
        pass
    serversocket.close()
    pass


class ServerThreading(threading.Thread):
    def __init__(self,clientsocket,recvsize=1024*1024,encoding="utf-8"):
        threading.Thread.__init__(self)
        self._socket = clientsocket
        self._recvsize = recvsize
        self._encoding = encoding
        pass

    def run(self):
        print("开启线程.....")
        try:
            #接受数据
            msg = ''
            while True:
                # 读取recvsize个字节
                rec = self._socket.recv(self._recvsize)
                # 解码
                msg += rec.decode(self._encoding)
                # 文本接受是否完毕，因为python socket不能自己判断接收数据是否完毕，
                # 所以需要自定义协议标志数据接受完毕
                print('msg: ', msg)
                if msg.strip().endswith('over'):
                    msg=msg[:-4]
                    break
            # 解析json格式的数据
            rec_json = json.loads(msg)
            print('rec_json: ', rec_json)
            if rec_json['method'] == 'getRgbFile':
                params = json.loads(rec_json['params'])
                rgb_path = getRgbFile(params["filePath"], params["bandWavelengthPath"],
                           params["rgbPathPrefix"], params["profilePath"])
                res = {"rgbPath": rgb_path}
            elif rec_json['method'] == 'segmentWaterLand':
                params = json.loads(rec_json['params'])
                rgb_path = segmentWaterLand(params["filePath"], params["bandWavelengthPath"],
                            params["segmentFilePrefix"], params["profilePath"], params["ndwiParam"],
                            params["closeParam"], params["openParam"])
                res = {"waterLandPath": rgb_path}
            elif rec_json['method'] == 'inverseWaterQuality':
                params = json.loads(rec_json['params'])
                result_path, minV, maxV, meanV = inverseWaterQuality(params["filePath"], params["bandWavelengthPath"],
                            params["resultFilePrefix"], params["profilePath"], params["index"],
                            params["method"], params["others"]) # others: rgb文件，水陆分割文件等
                res = {"waterLandPath": result_path, "min": minV, "max": maxV, "mean": meanV}
            
            # 调用神经网络模型处理请求
            # res = nnservice.hand(re['content'])
            sendmsg = json.dumps(res)
            print("sendmsg: ", sendmsg)
            # 发送数据
            self._socket.send(("%s"%sendmsg).encode(self._encoding))
            pass
        except Exception as identifier:
            self._socket.send("500".encode(self._encoding))
            print(identifier)
            pass
        finally:
            self._socket.close() 
        print("任务结束.....")
        pass

    def __del__(self):
        pass

from utils import linear_Stretch, get_air_data, find_near_index, WAVELENGTH
from PIL import Image
import cv2
import os
from skimage.measure import label, regionprops



def getRgbFile(airDataPath, bandWavelengthFile, rgbPathPrefix, profilePath):
    air_data = get_air_data(profilePath + "/" + airDataPath)
    with open(profilePath + "/" + bandWavelengthFile) as f:
        lines = f.readlines()
        bands = list(map(int, ''.join(lines).split("\n")))
    ## 处理rgb图像
    index_r = find_near_index(bands, 'red')
    index_g = find_near_index(bands, 'green')
    index_b = find_near_index(bands, 'blue')

    print('indexs: ', index_r, index_g, index_b)
    data_rgb = air_data[:, :, [index_r, index_g, index_b]]
    data_rgb_original = copy.deepcopy(data_rgb)
    # 线性拉伸
    rgb_path = rgbPathPrefix + "/" + airDataPath.split('/')[-1].split('.')[0] + ".png"
    save_path = profilePath + rgb_path
    data_rgb = linear_Stretch(data_rgb, th_low=0.0000001, th_high=100)

    data_rgb = data_rgb*255
    data_rgb = data_rgb.astype(np.uint8)
    im = Image.fromarray(data_rgb)
    im.save(save_path) 
    return rgb_path


def segmentWaterLand(airDataPath, bandWavelengthFile, segmentFilePrefix,
                     profilePath, ndwiParam, closeParam, openParam):
    dirs = segmentFilePrefix + "/temp"
    fileName = airDataPath.split('/')[-1].split('.')[0] + "_" + ndwiParam + \
               "_" + closeParam + "_" + openParam + ".png"
    if not os.path.exists(profilePath + dirs):
        os.makedirs(profilePath + dirs)
    elif os.path.exists(profilePath + dirs + "/" + fileName):
        return dirs + "/" + fileName
    air_data = get_air_data(profilePath + "/" + airDataPath)
    with open(profilePath + "/" + bandWavelengthFile) as f:
        lines = f.readlines()
        bands = list(map(int, ''.join(lines).split("\n")))
    ## ndwi
    tmp_data1 = np.empty(shape=(air_data.shape[0], air_data.shape[1]), dtype=float)
    index1 = find_near_index(bands, 750)
    index2 = find_near_index(bands, 560)

    for i in range(air_data.shape[0]):
        for j in range(air_data.shape[1]):
            if air_data[i,j,index1]==0 and air_data[i,j,index2]==0:
                tmp_data1[i, j] = 0
            else:
                tmp_data1[i, j] = (air_data[i,j,index1] - air_data[i,j,index2]) / (air_data[i,j,index1] + air_data[i,j,index2])# 750 560
    del(air_data)
    map_data = copy.deepcopy(tmp_data1)
    map_data[tmp_data1>=float(ndwiParam)] = int(256)
    map_data[tmp_data1<float(ndwiParam)] = int(0)
    del(tmp_data1)
    ## open
    ks = int(float(openParam))
    kernel = np.ones((ks, ks),np.uint8)  
    map_data1 = cv2.morphologyEx(map_data, cv2.MORPH_OPEN, kernel, iterations=1)  
    ## 连通域  
    map_data_label = label(map_data1, connectivity = 2)
    regionprop = regionprops(map_data_label)
    areas = []
    for i in range(len(regionprop)):
        areas.append(regionprop[i].area)
    area_th = sorted(areas)[-5]
    labels = []
    for i in range(len(regionprop)):
        if regionprop[i].area > area_th:
            labels.append(regionprop[i].label)

    for i in range(map_data1.shape[0]):
        for j in range(map_data1.shape[1]):
            if map_data_label[i][j] not in labels:
                map_data1[i][j] = 0
    ## close
    ks = int(float(closeParam))
    kernel = np.ones((ks, ks),np.uint8)  
    map_data2 = cv2.morphologyEx(map_data1, cv2.MORPH_CLOSE, kernel)    #闭运算1
    map_data2 = cv2.morphologyEx(map_data2, cv2.MORPH_CLOSE, kernel)    #闭运算2
    map_data2 = 256-map_data2
    cv2.imwrite(profilePath + dirs + "/" + fileName,map_data2)
    return dirs + "/" + fileName


def inverseWaterQuality(filePath, bandWavelengthFile, resultFilePrefix,
                        profilePath, index, method, others):
    fileName = filePath.split('/')[-1].split('.')[0] + "_" + index + \
               "_" + method
    if(filePath.lower().endswith(('.bmp', '.dib', '.png', '.jpg', '.jpeg', '.tif', '.tiff'))):
        imgFlag = 1
        fileName += ".jpg"
    elif(filePath.lower().endswith(('csv', 'xls', 'xlsx'))):
        imgFlag = 0
        fileName += ".csv"
    else:
        return "Wrong filePath, " + filePath

    dirs = resultFilePrefix + "/temp"
    if not os.path.exists(profilePath + dirs):
        os.makedirs(profilePath + dirs)
    elif os.path.exists(profilePath + dirs + "/" + fileName):
        return dirs + "/" + fileName
    # bands 
    with open(profilePath + "/" + bandWavelengthFile) as f:
        lines = f.readlines()
        bands = list(map(int, ''.join(lines).split("\n")))
    inverseDataDf, minV, maxV, meanV = inverseMethodMap[index.lower()](filePath, bands, profilePath, method, others, imgFlag)
    # if imgFlag==1:
    #     inverseData
    #     cv2.imwrite(profilePath + dirs + "/" + fileName, map_data2)
    if imgFlag==0:
        inverseDataDf.to_csv(profilePath + dirs + "/" + fileName, index=None)
    else:
        getHeatMap(inverseDataDf, others["rgbPath"], others["waterLandPath"], profilePath + dirs + "/" + fileName)

    return dirs + "/" + fileName, minV, maxV, meanV


if __name__ == "__main__":
    main()