package com.techelevator.controller;

import com.techelevator.petdao.JdbcPetDao;
import com.techelevator.petmodel.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class PetController {

    @Autowired
    private JdbcPetDao jdbcPetDao;

    public PetController(JdbcPetDao jdbcPetDao) {
        this.jdbcPetDao = jdbcPetDao;
    }

    @GetMapping(path = "/pets")
    public List<Pet> getAllPets() {
        return jdbcPetDao.getAllPets();
    }

    @RequestMapping(path = "/petid", method = RequestMethod.GET)
    public Pet getPetById(int newId) {
        Pet pet = new Pet();
        return jdbcPetDao.getPetById(pet.getPetID());
    }

    @RequestMapping(path = "/addnewpet", method = RequestMethod.POST)
    public Pet addPetListing(@RequestBody Pet pet) {
        return jdbcPetDao.addPetListing(pet);
    }

    @RequestMapping(path = "/updatepetlisting", method = RequestMethod.PUT)
    public void updatePetListing(@RequestBody Pet pet) { jdbcPetDao.updatePetListing(pet);}

}
