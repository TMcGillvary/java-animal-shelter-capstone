package com.techelevator.controller;

import com.techelevator.dao.JdbcUserDao;
import com.techelevator.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin

public class UserController {

   @Autowired
   private JdbcUserDao jdbcUserDao;

   public UserController (JdbcUserDao jdbcUserDao) {
       this.jdbcUserDao = jdbcUserDao;
   }

   @GetMapping (path = "/volunteerdirectory")
    public List<User> findAll() {
       return jdbcUserDao.findAll();
   }

}
