package org.example.my.shop.web.admin.dao;

import org.example.my.shop.domain.TbContentCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentCategoryDao {
    List<TbContentCategory> selectAll();
}
