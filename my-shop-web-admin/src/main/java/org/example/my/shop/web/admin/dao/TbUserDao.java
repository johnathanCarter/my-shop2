package org.example.my.shop.web.admin.dao;

import org.example.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbUserDao {

    List<TbUser> selectAll();

    TbUser login(String email);

    void insert(TbUser user);

    void delete(long id);

    TbUser selectById(long id);

    void update(TbUser user);

    void multiDelete(String[] ids);

    /**
     *
     * @param param start length
     * @return
     */
    List<TbUser> page(Map<String, Object> param);

    int count(TbUser tbUser);
}
