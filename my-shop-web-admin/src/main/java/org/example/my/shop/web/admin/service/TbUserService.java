package org.example.my.shop.web.admin.service;

import org.example.my.shop.commons.dto.BaseResult;
import org.example.my.shop.commons.dto.PageInfo;
import org.example.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserService {
    List<TbUser> selectAll();

    TbUser Login(String email);

    BaseResult save(TbUser user);

    void delete(long id);

    TbUser selectById(long id);

    void update(TbUser user);

    void multiDelete(String[] ids);

    PageInfo<TbUser> page(int straw, int start, int length, TbUser tbUser);

    int count(TbUser tbUser);
}
