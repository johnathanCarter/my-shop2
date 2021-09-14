package org.example.my.shop.web.admin.service.impl;

import org.example.my.shop.domain.TbContentCategory;
import org.example.my.shop.web.admin.dao.ContentCategoryDao;
import org.example.my.shop.web.admin.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {
    @Autowired
    ContentCategoryDao contentCategoryDao;

    @Override
    public List<TbContentCategory> selectAll() {
        return contentCategoryDao.selectAll();
    }
}
