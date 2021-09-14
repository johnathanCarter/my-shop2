package org.example.my.shop.web.admin.web.controller;

import org.example.my.shop.domain.TbContentCategory;
import org.example.my.shop.web.admin.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@RequestMapping("content/category")
@Controller
public class ContentCategoryController {

    @Autowired
    ContentCategoryService contentCategoryService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<TbContentCategory> tbContentCategories = contentCategoryService.selectAll();
        model.addAttribute("tbContentCategories", tbContentCategories);
        return "contentList";
    }

}
