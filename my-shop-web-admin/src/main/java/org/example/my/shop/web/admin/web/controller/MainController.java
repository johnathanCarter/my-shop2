package org.example.my.shop.web.admin.web.controller;

import org.example.my.shop.domain.TbUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainController {

    /**
     * jump to the main page
     * @return main page
     */
    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main(HttpServletRequest req) {
        TbUser user = (TbUser) req.getSession().getAttribute("user");
        req.setAttribute("userInfo", "welcome " + user.getUsername());
        return "main";
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    public String query(HttpServletResponse resp) {
        return "redirect:/userList";
    }

}
