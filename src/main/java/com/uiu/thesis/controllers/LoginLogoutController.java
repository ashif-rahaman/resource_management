package com.uiu.thesis.controllers;

import com.uiu.thesis.dao.interfaces.TokenDAO;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ashif
 */
@Controller
public class LoginLogoutController {

    @Autowired
    private TokenDAO tokenDAO;

    /**
     *
     * @param email
     * @param password
     * @param request
     * @return
     */
    @RequestMapping(
            value = "/login",
            params = {"email", "password"},
            method = RequestMethod.POST)
    public String doLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpServletRequest request) {

        if (email != null && !email.isEmpty()
                && password != null && !password.isEmpty()) {

            String token = tokenDAO.getToken(email, password);

            request.getSession().setAttribute("token", token);
        }

        return "/index";
    }

    /**
     *
     * @param token
     * @param request
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET, params = {"token"})
    public String doLogout(
            @RequestParam("token") String token,
            HttpServletRequest request) {

        if (token != null && !token.isEmpty()) {

            int value = tokenDAO.removeToken(token);
            request.getSession().setAttribute("token", null);

            if (value != 0) {

                return "/index";
            }
        }

        return "/home";
    }
}
