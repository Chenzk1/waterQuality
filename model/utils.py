import sys
import os
import pandas as pd
import numpy as np
import time
import datetime
import matplotlib as mlp
import copy
from collections import Counter
from sklearn.model_selection import train_test_split
import math
import cv2
from scipy.optimize import leastsq
import gdal
from gdalconst import GA_ReadOnly
import pickle

from sklearn.metrics import r2_score

import warnings
warnings.filterwarnings("ignore")

WAVELENGTH = { "red": 700,
               "green": 546,
               "blue": 434 }


def find_near_index(li, band):
    if isinstance(band, str):
        value = WAVELENGTH[band]
    else:
        value = int(band)
    df = pd.Series(li)
    range_max = df[df >= value].min()
    range_min = df[df <= value].max()
    # 判断更接近哪一个
    
    if abs(range_max-value) < abs(range_min - value):
        ans = range_max
    else:
        ans = range_min
    if abs(ans-value) < 50:
        idx = li.index(ans)
        return idx
    else:
        print("无波长为", value, "的波段")
        return -1

def getDataDf(filePath, bands):
    dataDf = pd.read_csv(filePath, header=None)
    if dataDf.shape[1] - len(bands) == 1: # 第一列是point
        dataDf = dataDf.iloc[:, 1:]
    if dataDf.iloc[0].mean() > 100:
        dataDf = dataDf.iloc[1:, :]
    dataDf.columns = bands
    return dataDf

def selectAir2df(air_data, select_bands_idx, select_bands):
    rows, cols = air_data.shape[0], air_data.shape[1]
    import pdb;pdb.set_trace()
    data_ = air_data[:,:, select_bands_idx].reshape(rows*cols, len(select_bands_idx)).tolist()
    # for x in range(rows):
    #     for y in range(cols):
    #         data_.append(air_data[x, y, select_bands_idx].tolist())
    air_data_df = pd.DataFrame(columns=select_bands, data=data_)
    return air_data_df

def inverseNh(filePath, bands, profilePath, method, others, imgFlag):
    index_r = find_near_index(bands, 'red')
    index_b = find_near_index(bands, 'blue')
    if imgFlag==0:
        dataDf = getDataDf(profilePath+filePath, bands)
        dataDf["Nh"] = dataDf[bands[index_b]] / (dataDf[bands[index_r]]+1e-12)
        dataDf["Nh"] = dataDf["Nh"].apply(lambda x: 0.065*math.exp(0.587*x))
        minV, maxV, meanV = dataDf['Nh'].min(), dataDf['Nh'].max(), dataDf['Nh'].mean()
    else:
        air_data = get_air_data(profilePath + "/" + filePath)
        dataDf = selectAir2df(air_data, [index_r, index_b], [bands[index_r], bands[index_b]])
        dataDf["Nh"] = dataDf[bands[index_b]] / (dataDf[bands[index_r]]+1e-12)
        dataDf["Nh"] = dataDf["Nh"].apply(lambda x: 0.065*math.exp(0.587*x))
        minV, maxV, meanV = dataDf['Nh'].min(), dataDf['Nh'].max(), dataDf['Nh'].mean()  
    dataDf["wq"] = dataDf["Nh"]      
    return dataDf["wq"], minV, maxV, meanV

def inverseTss(filePath, bands, profilePath, method, others, imgFlag):
    if imgFlag==0:
        dataDf = getDataDf(profilePath+filePath, bands)
    else:
        air_data = get_air_data(profilePath + "/" + filePath)
        dataDf = selectAir2df(air_data, [index_4, index_2], [bands[index_4], bands[index_2]])

    if "qaa" in method.lower():
        index_1 = find_near_index(bands, 610)
        index_2 = find_near_index(bands, 612)
        dataDf[bands[index_1]] = get_a(dataDf, bands, index_1)
        dataDf[bands[index_1]] = get_a(dataDf, bands, index_2)
        dataDf["wq"] = (dataDf[bands[index_1]] - dataDf[bands[index_2]]) / (dataDf[bands[index_1]] + dataDf[bands[index_2]]+1e-12)
        dataDf["wq"] = dataDf["wq"].apply(lambda x: 13.07*math.log(16.28*x)-18.74)
    elif "l1" in method.lower():
        f = open('tss-nnbs-l1-nn.model','rb') #注意此处model是rb
        s = f.read()
        model = pickle.loads(s)
        dataDf = select_bands(dataDf, bands, method) 
        dataDf['wq'] = model.predict(dataDf)
    elif "l2" in method.lower():
        f = open('tss-nnbs-l2-nn.model','rb') #注意此处model是rb
        s = f.read()
        model = pickle.loads(s)
        dataDf = select_bands(dataDf, bands, method) 
        dataDf['wq'] = model.predict(dataDf)
        
    minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()
    return dataDf["wq"], minV, maxV, meanV

def inverseTn(filePath, bands, profilePath, method, others, imgFlag):
    index_4 = find_near_index(bands, 830)
    index_2 = find_near_index(bands, 560)
    if imgFlag==0:
        dataDf = getDataDf(profilePath+filePath, bands)
        dataDf["wq"] = dataDf[bands[index_4]] / (dataDf[bands[index_2]]+1e-12)
        dataDf["wq"] = dataDf["wq"].apply(lambda x: 2.2632*x*x+1.1392*x+0.7561)
        minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()
    else:
        air_data = get_air_data(profilePath + "/" + filePath)
        dataDf = selectAir2df(air_data, [index_4, index_2], [bands[index_4], bands[index_2]])
        dataDf["wq"] = dataDf[bands[index_4]] / (dataDf[bands[index_2]]+1e-12)
        dataDf["wq"] = dataDf["wq"].apply(lambda x: 2.2632*x*x+1.1392*x+0.7561)
        minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()  
    return dataDf["wq"], minV, maxV, meanV

def inverseTp(filePath, bands, profilePath, method, others, imgFlag):
    index_4 = find_near_index(bands, 830)
    index_2 = find_near_index(bands, 560)
    if imgFlag==0:
        dataDf = getDataDf(profilePath+filePath, bands)
        dataDf["wq"] = dataDf[bands[index_4]] / (dataDf[bands[index_2]]+1e-12)
        dataDf["wq"] = dataDf["wq"].apply(lambda x: 749458*x*x+271.52*x+0.2397)
        minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()
    else:
        air_data = get_air_data(profilePath + "/" + filePath)
        dataDf = selectAir2df(air_data, [index_4, index_2], [bands[index_4], bands[index_2]])
        dataDf["wq"] = dataDf[bands[index_4]] / (dataDf[bands[index_2]]+1e-12)
        dataDf["wq"] = dataDf["wq"].apply(lambda x: 749458*x*x+271.52*x+0.2397)
        minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()  
    return dataDf["wq"], minV, maxV, meanV

def inverseChla(filePath, bands, profilePath, method, others, imgFlag):
    if imgFlag==0:
        dataDf = getDataDf(profilePath+filePath, bands)
    else:
        air_data = get_air_data(profilePath + "/" + filePath)
        dataDf = selectAir2df(air_data, [index_4, index_2], [bands[index_4], bands[index_2]])

    if "l1" in method.lower():
        f = open('chla-nnbs-l1-nn.model','rb') #注意此处model是rb
        s = f.read()
        model = pickle.loads(s)
        dataDf = select_bands(dataDf, bands, method) 
        dataDf['wq'] = model.predict(dataDf)
    elif "l2" in method.lower():
        f = open('chla-nnbs-l2-nn.model','rb') #注意此处model是rb
        s = f.read()
        model = pickle.loads(s)
        dataDf = select_bands(dataDf, bands, method) 
        dataDf['wq'] = model.predict(dataDf)
        
    minV, maxV, meanV = dataDf['wq'].min(), dataDf['wq'].max(), dataDf['wq'].mean()
    return dataDf["wq"], minV, maxV, meanV

def getHeatMap(air_wq, data_rgb, water_land_data, save_path):
    def float2int(ori_img):
        norm_img = np.array(ori_img * 255, dtype=np.uint8)
        return norm_img

    rows, cols = data_rgb.shape[0], data_rgb.shape[1]
    # air_wq['609_612_NDTI'] = air_wq['609_612_NDTI'].apply(np.around)
    air_wq['wq'].fillna('0123', inplace=True)
    for i in range(air_wq.shape[0]):
        if air_wq.loc[i, 'wq']=='0123'
            if i>0:
                air_wq.loc[i, 'wq'] = air_wq.loc[i-1, 'wq']
            else:
                air_wq.loc[i, 'wq'] = air_wq.loc[i+1, 'wq']

    mean_value = air_wq_values['wq'].mean()
    air_wq_values = air_wq['wq'].values.reshape(rows, cols)
    air_wq_values = air_wq_values.astype(float)
    air_wq_values = normalization_th(air_wq_values, 6, 98)
    for i in range(rows):
        for j in range(cols):
            if water_land_data[i][j] == 0:
                air_wq_values[i][j] = 0
            else:
                data_rgb[i][j][:] = 0
    norm_data_rgb = float2int(data_rgb)
    
    for i in range(rows):
        for j in range(cols):
            if water_land_data[i][j] == 0:
                air_wq_values[i][j] = mean_value
                
    air_wq_values = normalization_th(air_wq_values, 2, 98)
    for i in range(460):
        for j in range(2394):
            if water_land_data[i][j] == 0:
                air_wq_values[i][j] = 0
                
    air_wq_values = np.around(air_wq_values,decimals=1)
    import scipy
    air_wq_values_median_blur = scipy.signal.medfilt2d(air_wq_values, kernel_size=11)
    air_wq_values_median_blur = scipy.signal.medfilt2d(air_wq_values_median_blur, kernel_size=13)
    air_wq_values_blur2 = scipy.signal.medfilt2d(air_wq_values_median_blur, kernel_size=11)

    norm_img = np.zeros(air_wq_values.shape)
    cv2.normalize(air_wq_values_blur2, norm_img, 0, 255, cv2.NORM_MINMAX)
    norm_img = np.asarray(norm_img, dtype=np.uint8)
    heat_img = cv2.applyColorMap(norm_img, cv2.COLORMAP_WINTER) # 注意此处的三通道热力图是cv2专有的GBR排列
    heat_img = cv2.cvtColor(heat_img, cv2.COLOR_BGR2RGB)# 将BGR图像转为RGB图像
    # img_add = cv2.addWeighted(norm_data_rgb, 0.3, heat_img, 0.7, 0)
    # # 五个参数分别为 图像1 图像1透明度(权重) 图像2 图像2透明度(权重) 叠加后图像亮度
    # img_add = cv2.addWeighted(norm_data_rgb, 0.7, heat_img, 1.7, 1.5)
    # plt.imshow(img_add)
    for i in range(heat_img.shape[0]):
        for j in range(heat_img.shape[1]):    
            if heat_img[i][j][0]==0 and heat_img[i][j][1]==0 and heat_img[i][j][2]==255:
                heat_img[i][j][2] = 0
    img_add = cv2.add(norm_data_rgb, heat_img)
    # img_add = cv2.addWeighted(norm_data_rgb, 0.7, heat_img, 1.7, 1.5)
    fig = plt.figure(figsize=(58, 10))
    plt.imshow(img_add, vmin=4, vmax=22)
    plt.xticks([])
    plt.yticks([])
    plt.colorbar(pad=0.015,)
    plt.savefig(save_path, dpi=800, bbox_inches = 'tight')

def normalization_th(air_wq_values, th_low=1, th_high=99):
    maxout = 1.0
    minout = 0
    low = np.nanpercentile(air_wq_values[air_wq_values>-99999999].flatten(), th_low)
    high = np.nanpercentile(air_wq_values[air_wq_values>-99999999].flatten(), th_high)
    
    for i in range(air_wq_values.shape[0]):
        for j in range(air_wq_values.shape[1]):
            if air_wq_values[i][j] == -99999999:
                continue
            air_wq_values[i][j] = minout + ((air_wq_values[i][j]-low) / (high-low)) * (maxout-minout)
            if air_wq_values[i][j] < minout:
                air_wq_values[i][j] = minout
            elif air_wq_values[i][j] > maxout:
                air_wq_values[i][j] = maxout
    return air_wq_values

def linear_Stretch(data_rgb, th_low=2, th_high=99.9):
    maxout = 1
    minout = 0
    band_num = data_rgb.shape[2]
    for i in range(3):
        low = np.nanpercentile(data_rgb[:,:,i], 2)
        high = np.nanpercentile(data_rgb[:,:,i], 99.9)

        data_rgb[:,:,i] = minout + ( (data_rgb[:,:,i]-low) / (high-low) ) * (maxout - minout)
        data_rgb[:,:,i][data_rgb[:,:,i] < minout]=minout
        data_rgb[:,:,i][data_rgb[:,:,i] > maxout]=maxout
    return data_rgb

def get_airplane_waves_index_dict(hdr_file):
    with open(hdr_file) as hdr:
        lines = hdr.readlines()
        for i, line in enumerate(lines):
            if line.startswith('wavelength = '):
                break
        airplane_waves = []
        for j in range(i+1, len(lines)):
            tmp = lines[j].strip().split(',')
            for t in tmp:
                if len(t) < 1:
                    continue
                if '}'==t[-1]:
                    t = t[:-1]
                airplane_waves.append(float(t.strip()))

    waves_index_dict = {int(round(wave)):index for index,wave in enumerate(airplane_waves)}
    return waves_index_dict

def air2df(air_data, air_bands):
    rows, cols = air_data.shape[0], air_data.shape[1]
    data_ = []
    for x in range(rows):
        for y in range(cols):
            data_.append(air_data[x, y, :].tolist())
    air_data_df = pd.DataFrame(columns=air_bands, data=data_)
    return air_data_df

def get_air_data(image_path):
    gdal.UseExceptions()
    dataset = gdal.Open(image_path, GA_ReadOnly)
    if dataset is None:
        print("The input path is unavailable!")
        sys.exit(0)

    _xsize = dataset.RasterXSize
    _ysize = dataset.RasterYSize
    _band = dataset.RasterCount
    _geotransform = dataset.GetGeoTransform()
    _projection = dataset.GetProjection()
    dataArray = dataset.ReadAsArray()
    # print(_xsize, _ysize, _band, _geotransform, _projection)
    print("air data shape: ", dataArray.shape)

    air_data = dataArray.transpose((1,2,0))
    rows, cols, channel = dataArray.shape
    #绕图像的中心旋转
    #参数：旋转中心 旋转度数 scale
    if "maozhouhe" in airDataPath:
        alpha1 = (3-1201)/(401-208)
        alpha2 = -1 / alpha1
        theta = math.atan(alpha2)
        M = cv2.getRotationMatrix2D((cols/2, rows/2), -theta*180/3.14, 1)
        #参数：原始图像 旋转参数 元素图像宽高
        air_data = cv2.warpAffine(dataArray, M, (cols, rows))
    # air_data = air_data[210:670, :, :]
    return air_data

def get_air_data_rgb(air_data):
    ## 处理rgb图像
    index_r, index_g, index_b = 108, 68, 32
    band_length_r, band_length_g, band_length_b = 700.0, 546.1, 435.8

    data_rgb = air_data[:, :, [index_r, index_g, index_b]]
    data_rgb_original = copy.deepcopy(data_rgb)
    plot_rgb_hist(data_rgb_original, title="original rgb img histogram")
    # 线性拉伸
    data_rgb = linear_Stretch(data_rgb, th_low=0.0000001, th_high=100)
    plot_rgb_hist(data_rgb, title="after linear stretch rgb img histogram")
    # 均值滤波
    # data_rgb_blur = cv2.blur(data_rgb, (3,3))
    # plot_rgb_hist(data_rgb_original, title="after blur rgb img histogram")
    return data_rgb

def plot_rgb_hist(data_rgb, title="hist of rgb img"):
    hist_full = cv2.calcHist([data_rgb], [0], None, [100], [0,1])
    #plt.plot(hist_full)
    #plt.title(title)
    #plt.show()

def get_interest_region(air_data, air_data_rgb, air_bands):
    def get_region_from_startpoint(startx, starty, span_x=50, span_y=100):
        region = []
        tmp = []
        tmp.append((startx, starty))
        tmp.append((startx+span_x, starty))
        tmp.append((startx, starty+span_y))
        tmp.append((startx+span_x, starty+span_y))
        region = tmp
#         endx = startx + 50*math.cos(math.atan(alpha2))
#         endy = starty + 50*math.sin(math.atan(alpha2))
#         tmp.append((int(endx), int(endy)))
#         region.extend(tmp)
#         for startx, starty in tmp:
#             endx = startx - 100*math.cos(math.atan(-alpha1))
#             endy = starty + 100*math.sin(math.atan(-alpha1))
#             region.append((int(endx), int(endy)))
        return region

    def plot_region_from_startpoint(regions):
        def plot_one_region(region):
            minx, miny, maxx, maxy = 9999, 9999, 0, 0
            for x, y in region:
                minx, miny, maxx, maxy = min(minx, x), min(miny,y), max(maxx, x), max(maxy, y)
            left_top_x, left_top_y = region[0][0], region[0][1]
            left_bottom_x, left_bottom_y = region[1][0], region[1][1]
            right_top_x, right_top_y = region[2][0], region[2][1]
            right_bottom_x, right_bottom_y = region[3][0], region[3][1]

            data_rgb[minx:maxx, miny:miny+5, 0] = 1
            data_rgb[minx:maxx, miny:miny+5, 1] = 0
            data_rgb[minx:maxx, miny:miny+5, 2] = 0

            data_rgb[minx:maxx, maxy:maxy+5, 0] = 1
            data_rgb[minx:maxx, maxy:maxy+5, 1] = 0
            data_rgb[minx:maxx, maxy:maxy+5, 2] = 0

            data_rgb[minx:minx+5, miny:maxy, 0] = 1
            data_rgb[minx:minx+5, miny:maxy, 1] = 0
            data_rgb[minx:minx+5, miny:maxy, 2] = 0

            data_rgb[maxx:maxx+5, miny:maxy+5, 0] = 1
            data_rgb[maxx:maxx+5, miny:maxy+5, 1] = 0
            data_rgb[maxx:maxx+5, miny:maxy+5, 2] = 0

            data_region_df = []
            data_region = air_data[minx:maxx, miny:maxy, :]
            for x in range(minx, maxx):
                for y in range(miny, maxy):
                    data_region_df.append(air_data[x, y, :].tolist())
            return data_region_df, data_region

        air_data_df = pd.DataFrame(columns=['region']+air_bands)
        air_data_dict = {}
        for i, region in enumerate(regions):
            tmp_data_df, tmp_data = plot_one_region(region)
            air_data_dict[i] = tmp_data
            tmp_df = pd.DataFrame(columns=air_bands, data=tmp_data_df)
            tmp_df['region'] = i
            air_data_df = pd.concat([air_data_df, tmp_df])
        #     plt.text(region[0][1]+spany//2-5, region[0][0]+spanx//2+5, str(i), c='red', size='xx-large')
        # plt.imshow(data_rgb)
#         plt.savefig('../images/0311rgb_region_mosaic_0601.png', dpi=800)
        # plt.show()
        return air_data_df, air_data_dict, data_rgb

    data_rgb = copy.deepcopy(air_data_rgb)
    # 401 3; 186 1201
    regions = []
    spanx, spany = 50, 100
    regions.append(get_region_from_startpoint(372-210, 350, spanx, spany))
    regions.append(get_region_from_startpoint(540-210, 820, spanx, spany))
    regions.append(get_region_from_startpoint(400-210, 1300, spanx, spany))
    regions.append(get_region_from_startpoint(320-210, 1720, spanx, spany))

    data_air_regions_df, data_air_regions_dict, data_rgb_region = plot_region_from_startpoint(regions)
    return data_air_regions_df, data_air_regions_dict, data_rgb_region

def get_hand_data(spectral_0311_file = "../data/0311spectral.csv", ground_data_311_file = "../data/0311.csv"):
    def read_spectral_file(spectral_0311_file):
        spectral_0311 = pd.read_csv(spectral_0311_file, encoding='gbk')
        spectral_0311['波长'] = spectral_0311['波长'].apply(lambda x: int(np.round(x)))
        spectral_0311.sort_values(by='波长', inplace=True)
        col_map = {}
        remove_cols = []
        for col in spectral_0311.columns:
            if '异常' in col:
                remove_cols.append(col)
                continue
            else:
                col_map[col] = col[:4]
        col_map['波长'] = 'index'
        spectral_0311.rename(columns=col_map, inplace=True)
        spectral_0311.drop(columns=remove_cols, inplace=True)

        spectral_0311.set_index(["index"], inplace=True)
        spectral_0311 = spectral_0311.T
        spectral_0311.reset_index(inplace=True)
        spectral_0311.rename(columns={'index':'point'}, inplace=True)
        return spectral_0311

    def obj2float(data):
        for col in ['COD', 'TP', 'NH', 'TSS', 'Tran', 'Chla']:
            if data[col].dtype == 'object':
                count = 0
                for v in data[col].values:
                    if 'L' in v:
                        count += 1
                if count > 0:
                    print(f'data 0311 列: {col}, 到达检出限的点数量: {count}')
                data[col] = data[col].apply(lambda x: float(x) if 'L' not in x else float(x[:-3]))
        return data
    ## spectral data
    spectral_0311 = read_spectral_file(spectral_0311_file)
    ## ground data
    ground_data_311 = pd.read_csv(ground_data_311_file, encoding='gbk')
    ground_data_311 = ground_data_311.iloc[:40]
    ground_data_311.drop(columns='样品状态', inplace=True)
    column_map = {'监测日期':'date', '序号':'id', '时间': 'time', '采样点编号': "point", '监测点位置（°）': 'lat', 'Unnamed: 5': "lon",
                '化学需氧量\nCODcr（mg/L）':"COD", '总磷（mg/L）':'TP','氨氮（mg/L）':'NH', '总悬浮物（mg/L）':'TSS',
                '浊度（度）':"Tran", '叶绿素 a（?g/L）': 'Chla'}
    ground_data_311.rename(columns=column_map, inplace=True)
    ## all data
    data_311 = pd.merge(ground_data_311, spectral_0311, how='inner', on='point')
    data_311['id'] = data_311['id'].apply(np.int)
    bands = data_311.columns.tolist()[12:]
    data_311 = obj2float(data_311)
    return data_311, bands

def get_hand_data_0805(spectral_0805_file, ground_data_0805_file):
    def read_spectral_file(spectral_0805_file):
        spectral_0805 = pd.read_csv(spectral_0805_file, encoding='gbk')
        spectral_0805.sort_values(by='Wavelength', inplace=True)
        col_map = {}
        for col in spectral_0805.columns:
            new_name = "-".join(col.strip().split('-')[-2:])
            col_map[col] = new_name
        spectral_0805.rename(columns=col_map, inplace=True)
        spectral_0805.set_index(['Wavelength'], inplace=True)
        spectral_0805 = spectral_0805.T
        spectral_0805.reset_index(inplace=True)
        spectral_0805.rename(columns={'index':'point'}, inplace=True)
        return spectral_0805
    
    def obj2float(data):
        for col in ['Chla', 'Turb', 'TSS', 'COD', 'TP', 'NH', 'BOD']:
            if data[col].dtype == 'object':
                count = 0
                for v in data[col].values:
                    if 'L' in v:
                        count += 1
                if count > 0:
                    print(f'data 0805 列: {col}, 到达检出限的点数量: {count}')
                data[col] = data[col].apply(lambda x: float(x) if 'L' not in x else float(x[:-3]))
        return data
    spectral_0805 = read_spectral_file(spectral_0805_file)

    ground_data_0805 = pd.read_csv(ground_data_0805_file, encoding='gbk')
    ground_data_0805['date'] = '2019/8/5'
    ground_data_0805['time'] = 'null'
    column_map = {'序号':'id', '采样编号': 'point', "纬度": "lat", "经度": "lon", '叶绿素a（?g\L）': 'Chla',
                  '总悬浮物（mg/L）':'TSS', '化学需氧量（mg/L）': "COD",  '总磷（mg/L）':'TP', '氨氮（mg/L）':'NH', 
                  '五日生化需氧量（mg\L）': "BOD", '浊度（度）': 'Turb'
                 }
    ground_data_0805.rename(columns=column_map, inplace=True)
    ## all data
    data_0805 = pd.merge(ground_data_0805, spectral_0805, how='inner', on='point')
    bands = data_0805.columns.tolist()[13:]
    data_0805 = obj2float(data_0805)
    return data_0805, bands

def get_b_bw(waves):
    b_w = np.zeros(len(waves))
    for i, wave in enumerate(waves):
        b_w[i] = 2*0.00144*((wave/500) ** (-4.32))
    b_bw = b_w/2
    return b_bw

def get_a_w_dict():
    a_w_dict = {}
    a_w_dict[444] = 0.00751
    a_w_dict[511] = 0.0345
    a_w_dict[560] = 0.0619
    a_w_dict[670] = 0.4303
    a_w_dict[671] = 0.445
    a_w_dict[753] = 2.773
    a_w_dict[754] = 2.7709
    return a_w_dict

def get_waves_index_dict(waves):
    waves_index_dict = {}
    waves_index_dict = {int(round(wave)):index for index,wave in enumerate(waves)}
    return waves_index_dict

def analyse_log(log_file):
    a_relu_loss, total_loss, bbp_null, bbp_below_0, a_null, a_below_0, bbp_corr, a_corr = \
        [], [], [], [], [], [], [], []
    w = []
    with open(log_file, 'r') as f:
        lines = f.readlines()
        cur_a_relu_loss, cur_total_loss, cur_bbp_null, cur_bbp_below_0, cur_a_null, \
                    cur_a_below_0, cur_bbp_corr, cur_a_corr = 0, 0, [], [], [], [], [], []
        for line in lines:
#             import pdb
#             pdb.set_trace()
            if line.startswith('a_relu loss'):
                if len(cur_bbp_null)==2:
                    a_relu_loss.append(cur_a_relu_loss)
                    total_loss.append(cur_total_loss)
                    bbp_null.append(cur_bbp_null)
                    bbp_below_0.append(cur_bbp_below_0)
                    a_null.append(cur_a_null)
                    a_below_0.append(cur_a_below_0)
                    bbp_corr.append(cur_bbp_corr)
                    a_corr.append(cur_a_corr)
                    w.append(cur_w)
                cur_a_relu_loss, cur_total_loss, cur_bbp_null, cur_bbp_below_0, cur_a_null, \
                    cur_a_below_0, cur_bbp_corr, cur_a_corr = 0, 0, [], [], [], [], [], []
                cur_w = []
            if line.startswith('a_relu loss'):
                cur_a_relu_loss = float(line.strip().split(':')[1].strip())
            elif line.startswith('total loss'):
                cur_total_loss = float(line.strip().split(':')[1].strip())
            elif line.startswith('b_bp null value num'):
                cur_bbp_null.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('b_bp wave length in [400, 900] null value num'):
                cur_bbp_null.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('b_bp < 0 value num'):
                cur_bbp_below_0.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('b_bp wave length in [400, 900] < 0 value num'):
                cur_bbp_below_0.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('a null value num'):
                cur_a_null.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('a < 0 value num'):
                cur_a_below_0.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('a wave length in [400, 900] null value num'):
                cur_a_null.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('a wave length in [400, 900] < 0 value num'):
                cur_a_below_0.append(float(line.strip().split(':')[1].strip()))
            elif line.startswith('wavelength < 900: max corr is') and not cur_bbp_corr and not cur_a_corr:
                tmp = line.strip().split(',')
                for t in tmp:
                    cur_bbp_corr.append(float(t.strip().split()[-1]))
            elif line.startswith('wavelength < 900: max corr is') and cur_bbp_corr and not cur_a_corr:
                tmp = line.strip().split(',')
                for t in tmp:
                    cur_a_corr.append(float(t.strip().split()[-1]))
            elif line.startswith('W = '):
                cur_w = line.strip().split(', loss')[0].strip().split('=')[1].strip()

    return a_relu_loss, total_loss, bbp_null, bbp_below_0, a_null, a_below_0, bbp_corr, a_corr, w




