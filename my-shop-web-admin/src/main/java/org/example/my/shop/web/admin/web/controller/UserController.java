package org.example.my.shop.web.admin.web.controller;

import org.apache.commons.lang3.StringUtils;
import org.example.my.shop.commons.dto.BaseResult;
import org.example.my.shop.commons.dto.PageInfo;
import org.example.my.shop.domain.TbUser;
import org.example.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    TbUserService tbUserService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<TbUser> users = tbUserService.selectAll();
        model.addAttribute("users", users);
        return "userList";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(Model model, HttpServletRequest req) {
        TbUser user = new TbUser();
        String username = req.getParameter("username");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String password = DigestUtils.md5DigestAsHex(req.getParameter("password").getBytes());

        user.setUsername(username);
        user.setPhone(phone);
        user.setEmail(email);
        user.setPassword(password);

        BaseResult base = tbUserService.save(user);

        model.addAttribute("baseResult", base);

        return "redirect:/user/list";
    }

    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) throws IOException {
        BaseResult baseResult;
        if (!StringUtils.isBlank(ids)) {
            String[] split = ids.split(",");
            tbUserService.multiDelete(split);
            baseResult = BaseResult.success();
        } else {
            baseResult = BaseResult.failure();
        }
        return baseResult;
    }

    @ResponseBody
    @RequestMapping(value = "details", method = RequestMethod.POST)
    public TbUser details(HttpServletRequest httpServletRequest) {
        String id = httpServletRequest.getParameter("id");
        long id_p = parseID(id);
        return tbUserService.selectById(id_p);
    }

    public long parseID(String id) {
        if (id != null) {
            return Integer.parseInt(id);
        } else return 0L;
    }

    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<TbUser> page(HttpServletRequest httpServletRequest, TbUser tbUser) {
        String strDraw = httpServletRequest.getParameter("draw");
        String strStart = httpServletRequest.getParameter("start");
        String strLength = httpServletRequest.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        return tbUserService.page(draw, start, length, tbUser);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(HttpServletRequest httpServletRequest) {
        TbUser user = new TbUser();
        long id = parseID(httpServletRequest.getParameter("id"));
        user.setUsername(httpServletRequest.getParameter("username-show"));
        user.setPhone(httpServletRequest.getParameter("phone-show"));
        user.setEmail(httpServletRequest.getParameter("email-show"));
        user.setId(id);
        tbUserService.update(user);
        return "userList";
    }

    @RequestMapping(value = "deleteById", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest httpServletRequest) {
        long id = parseID(httpServletRequest.getParameter("id"));
        tbUserService.delete(id);
        return "redirect:/user/list";
    }
}
