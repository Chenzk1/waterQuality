package com.ruoyi.project.system.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.project.system.service.IRemoteCallService;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

@Service
public class RemoteCallServiceImpl implements IRemoteCallService {
    public JSONObject remoteCall(String method, String params) throws UnknownHostException {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("method", method);
        jsonObject.put("params", params);
        String str = jsonObject.toJSONString();
        // 访问服务进程的套接字
        Socket socket = null;
        InetAddress addr = InetAddress.getLocalHost();
        String HOST = addr.getHostName();
        int PORT = 9528;
        System.out.println("调用远程接口: host=>"+HOST+", port=>"+PORT);
        try {
            // 初始化套接字，设置访问服务的主机和进程端口号，HOST是访问python进程的主机名称，可以是IP地址或者域名，PORT是python进程绑定的端口号
            socket = new Socket(HOST, PORT);
            // 获取输出流对象
            OutputStream os = socket.getOutputStream();
            PrintStream out = new PrintStream(os);
            // 发送内容
            out.print(str);
            // 告诉服务进程，内容发送完毕，可以开始处理
            out.print("over");
            // 获取服务进程的输入流
            InputStream is = socket.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));
            String tmp = null;
            StringBuilder sb = new StringBuilder();
            // 读取内容
            while((tmp=br.readLine())!=null)
                sb.append(tmp).append('\n');
            System.out.println("sb:" + sb);
            // 解析结果
            JSONObject res = JSON.parseObject(sb.toString());
            System.out.println("res:" + res);
            return res;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {if(socket!=null) socket.close();} catch (IOException e) {}
            System.out.println("远程接口调用结束.");
        }
        return null;
    }
}
