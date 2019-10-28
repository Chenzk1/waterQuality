package com.ruoyi.project.system.mapper;

import java.util.List;
import com.ruoyi.project.system.domain.DataManage;
import com.ruoyi.project.system.domain.RetrievalResult;

public interface DataManageMapper {
    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    public List<DataManage> selectDataList(DataManage dataQuery);

    public List<DataManage> selectUniqueByDictCode(DataManage dataQuery);

    public List<String> selectUniqueType();
    public List<String> selectUniqueWaterName();
    public List<String> selectUniqueId();
    public List<String> selectUniqueCountry();
    public List<String> selectUniqueProvince();
    public List<String> selectUniqueCity();

    public int selectNUniqueType();
    public int selectNUniqueWaterName();
    public int selectNUniqueId();
    public int selectNUniqueCountry();
    public int selectNUniqueProvince();
    public int selectNUniqueCity();

    public List<RetrievalResult> selectTp(long waterId);
    public List<RetrievalResult> selectTn(long waterId);
    public List<RetrievalResult> selectNh(long waterId);
    public List<RetrievalResult> selectCod(long waterId);
    public List<RetrievalResult> selectChla(long waterId);
    public List<RetrievalResult> selectTss(long waterId);

    public void updateWater(DataManage dataManage);
    public int insertWater(DataManage dataManage);
}
