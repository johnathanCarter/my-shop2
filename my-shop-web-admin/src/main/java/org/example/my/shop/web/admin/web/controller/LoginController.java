package org.example.my.shop.web.admin.web.controller;


import org.example.my.shop.domain.TbUser;
import org.example.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class LoginController {

    @Autowired
    private TbUserService userService;

    /**
     * jump to login page
     *
     * @return login page
     */
    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * login function
     *
     * @param email
     * @param password
     * @return response page
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam(required = true) String email,
                        @RequestParam(required = true) String password,
                        @RequestParam(required = false) String isRemember,
                        HttpServletRequest req,
                        HttpServletResponse resp) {
        TbUser user;
        if (null != (user = userService.Login(email))) {
            if (DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
                req.getSession().setAttribute("user", user);
                req.setAttribute("userInfo", "welcome " + user.getUsername());
                return "redirect:/main";
            }
        }
        req.setAttribute("message" ,"incorrect username or password");
        return login();
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req) {
        req.getSession().invalidate();
        return login();
    }
}