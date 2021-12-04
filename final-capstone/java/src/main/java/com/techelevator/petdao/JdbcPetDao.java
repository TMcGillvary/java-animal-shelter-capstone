package com.techelevator.petdao;

import com.techelevator.petmodel.Pet;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JdbcPetDao implements PetDAO {

    private JdbcTemplate jdbcTemplate;

    public JdbcPetDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Pet> getAllPets() {
        List<Pet> pets = new ArrayList<>();
        String sql = "SELECT * FROM pets;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        if (results.next()) {
            Pet pet = mapRowToPet(results);
            pets.add(pet);
        }
        return pets;
    }

    private Pet mapRowToPet(SqlRowSet results) {
        Pet pet = new Pet();
        // TODO: remember to come and put this in here
        pet.setPetID(results.getInt(""));
        pet.setName(results.getString(""));
        pet.setDescription(results.getString(""));
        pet.setAdoptable(results.getBoolean(""));
        pet.setPic(results.getString(""));
        pet.setBreed(results.getString(""));
        pet.setType(results.getString(""));
        return pet;
    }

}
