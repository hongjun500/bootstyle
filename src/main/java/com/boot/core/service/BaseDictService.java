package com.boot.core.service;

import com.boot.core.pojo.BaseDict;

import java.util.List;

public interface BaseDictService {
    public List<BaseDict> findBaseDictByTypeCode(String typecode);
}
