package com.techelevator.controller;

import com.techelevator.petdao.JdbcPetDao;
import com.techelevator.petmodel.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class PetController {

    @Autowired
    private JdbcPetDao jdbcPetDao;

    public PetController(JdbcPetDao jdbcPetDao) {
        this.jdbcPetDao = jdbcPetDao;
    }

    @GetMapping(path = "/")
    public List<Pet> getAllPets() {
        return jdbcPetDao.getAllPets();
    }
}
