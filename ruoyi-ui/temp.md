## form data上传

- 支持Blob/file/string格式
  
### 前端

```JavaScript
let upFormData = new FormData();
upFormData.append('body', JSON.stringify(this.temp)) // 对象要序列化为字符串
upFormData.append('remoteTableFile', this.uploadCsv.file)
```

### 后端

- Put用RequestParam，Post貌似可以用RequestBody
```Java
    @PutMapping
    public AjaxResult editWater(@RequestParam(value = "body") String dataManageString, // 要用string接收
                           @RequestParam(value = "bandWavelengthFile", required = false) MultipartFile bandWavelengthFile,
                           @RequestParam(value = "remoteTableFile", required = false) MultipartFile remoteTableFile) throws IOException
    {
        DataManage dataManage = JSON.parseObject(dataManageString, DataManage.class); //再反序列化为对象
    }
```
