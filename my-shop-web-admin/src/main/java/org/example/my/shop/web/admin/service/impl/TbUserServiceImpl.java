package org.example.my.shop.web.admin.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.example.my.shop.commons.dto.BaseResult;
import org.example.my.shop.commons.dto.PageInfo;
import org.example.my.shop.domain.TbUser;
import org.example.my.shop.web.admin.dao.TbUserDao;
import org.example.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserDao tbUserDao;

    @Override
    public List<TbUser> selectAll() {
        return tbUserDao.selectAll();
    }

    @Override
    public TbUser Login(String email) {
        return tbUserDao.login(email);
    }

    @Override
    public BaseResult save(TbUser user) {
        BaseResult baseResult = checkTbUser(user);
        user.setUpdated(new Date());
        if (baseResult.getStatus() == 200) {
            tbUserDao.insert(user);
        }
        return baseResult;
    }

    @Override
    public void delete(long id) {
        tbUserDao.delete(id);
    }

    @Override
    public TbUser selectById(long id) {
        return tbUserDao.selectById(id);
    }

    @Override
    public void update(TbUser user) {
        tbUserDao.update(user);
    }

    @Override
    public void multiDelete(String[] ids) {
        tbUserDao.multiDelete(ids);
    }

    @Override
    public PageInfo<TbUser> page(int draw, int start, int length, TbUser tbUser) {
        int count = tbUserDao.count(tbUser);

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("length", length);
        map.put("tbUser", tbUser);

        PageInfo<TbUser> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(tbUserDao.page(map));

        return pageInfo;
    }

    @Override
    public int count(TbUser tbUser) {
        return tbUserDao.count(tbUser);
    }

    private BaseResult checkTbUser(TbUser user) {
        BaseResult baseResult = BaseResult.success();
        if (StringUtils.isBlank(user.getUsername())) {
            baseResult = BaseResult.failure("username must not be null");
        }
        if (StringUtils.isBlank(user.getPassword())) {
            baseResult = BaseResult.failure("password must not be null");
        }
        if (StringUtils.isBlank(user.getEmail())) {
            baseResult = BaseResult.failure("email must not be null");
        }
        return baseResult;
    }
}
