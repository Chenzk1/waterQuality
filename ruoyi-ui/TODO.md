1. 水质反演：后台实现功能
2. 水质分析：需要水质达标的数据库（已经建表，需要实现“不达标水质指标”功能）


## 接口

1. 读取tif文件并自动生成rgb文件的功能

```python
getRgbPath(filePath, bandWavelengthPath, rgbPathPrefix):
   read(filePath)
   read(bandWavelengthPath)
   getRgb()
   rgbPath = save()
   return rgbPath
```

2. 水陆分割

```python
segmentWaterLand(filePath, bandWavelengthPath, tempPathPreifx, ndwiParam, openParam, closeParam):
   read(filePath)
   read(bandWavelengthPath)
   file = segment(ndwiParam, openParam, closeParam)
   tempPath = save(file, tempPathPreifx)
   return tempPath
```

3. 保存水陆分割结果

sql中写入tempPath

4. 水质反演

```python
inverseWaterQuality(filePath, bandWavelengthPath, tempPathPreifx, index):
   read(filePath)
   read(bandWavelengthPath)
   file, min, max, mean = inverse(index)
   tempPath = save(file, tempPathPreifx)
   return tempPath, min, max, mean
```

5. 保存水质反演结果

sql中写入tempPath