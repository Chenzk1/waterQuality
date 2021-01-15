## water_info

- key: water_id
- type: 遥感数据的数据源类型
  - 对于csv文件，建议数据中无header，无index，第一列为point，每行为一个点位的数据，每列的波长与波长文件对应；或者第一行为point + 每个波段的波长值
  - 自定义的数据，type为custom+water_id
- data_type: 0 影像，1 csv
  - 对于影像数据，需要新建water_land的一条
- band_wavelength_file_path: type为自定义的话用上传的，非自定义，按照卫星类别存储
- file_path: datatype为0，则为影像路径，否则为csv路径
- rgb_path: default NULL, 若datatype为0，则从band_wavelength_file_path中抽出

## remote_data_type

- key: type
- path: 波段波长的文件，文件格式为一行一个波长，单位为nm，txt格式

## water_land

- water_id
- water_land_path: default NULL, 若datatype为0，则通过水质反演
- ndwi_param: 0
- close_param: 5
- open_param: 5

## tp etc.

反演且点击保存的时候再更新

- key: water_id
- save_method: 保存此时使用的方法
  - 若为自定义，只支持普通的单波段/多波段模型，通式为f((B1), (B2), ...)
- result_path: rgb的空间分布图路径 or csv路径
- min: default null
- max: default null
- mean: default null
- standard_flag
- update_time   

## water_quality_standard

- param: "tp", "tsm", "chla", "cod"