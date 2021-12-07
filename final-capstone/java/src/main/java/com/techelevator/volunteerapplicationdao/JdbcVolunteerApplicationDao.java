package com.techelevator.volunteerapplicationdao;

import com.techelevator.volunteerapplicationmodel.VolunteerApplication;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcVolunteerApplicationDao implements VolunteerApplicationDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcVolunteerApplicationDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public VolunteerApplication saveNewForm() {
        String sql = "INSERT INTO applications WHERE name = ? AND email = ? AND phone = ?  description = ? ";
    }
}
