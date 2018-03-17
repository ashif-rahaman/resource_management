/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uiu.thesis.controllers;

import com.uiu.thesis.dao.interfaces.HumanResourceTypeDAO;
import com.uiu.thesis.models.user.HumanResourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Ishara Dikkumbura
 */
@Controller
public class HomeController {

    @Autowired
    private HumanResourceTypeDAO hrTypeDAO;

    @RequestMapping(value = "/index")
    public String showIndex() {
        return "index";
    }

    /**
     * insert data into human_resource_type table
     *
     * @return
     */
    @RequestMapping(value = "/insert/hrtype")
    public String insertHRType() {

        int id = 0;
        String[] hrTypes = {
            "general adminstrator",
            "academic adminstrator",
            "faculty",
            "faculty adminstrator",
            "staff"
        };

        HumanResourceType hrType = new HumanResourceType();

        for (String hrt : hrTypes) {

            hrType.setResourceType(hrt);
            id = hrTypeDAO.addHRType(hrType);
        }

        if (id != 0) {
            return "success";
        } else {
            return "fail";
        }
    }

}
