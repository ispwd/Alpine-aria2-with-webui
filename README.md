Alpine Aria2 WebUI
---
基于alpine Linux的aria2镜像，体积非常小，适用于群晖NAS等。
默认conf文件夹存放aria2的配置，data文件夹存放日志和下载文件
环境变量SECRET是aria2的连接秘钥，可自行修改。（记得在aria2-webui中改为对应的SECRET）
群晖等NAS下如果系统自动分配端口则需要在aria2-webui中手动配置为对应的端口

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name alpine-aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/aria2/data \
-v /CONFIG_DIR:/aria2/conf \
-e SECRET=YOUR_SECRET_CODE \
ispwd/alpine-aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

### Build:  
`sudo docker build -f Dockerfile -t ispwd/alpine-aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

https://github.com/acgotaku/BaiduExporter  