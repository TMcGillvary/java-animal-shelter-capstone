package com.techelevator.controller;

import com.techelevator.volunteerapplicationdao.JdbcVolunteerApplicationDao;
import com.techelevator.volunteerapplicationmodel.VolunteerApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin
public class VolunteerApplicationController {
    @Autowired
    private JdbcVolunteerApplicationDao jdbcVolunteerApplicationDao;

    public VolunteerApplicationController(JdbcVolunteerApplicationDao jdbcVolunteerApplicationDao) {
        this.jdbcVolunteerApplicationDao = jdbcVolunteerApplicationDao;
    }

    @RequestMapping(path = "/applicationid", method = RequestMethod.GET)
    public VolunteerApplication getVolunteerApplicationById(int newId) {
        VolunteerApplication volunteerApplication = new VolunteerApplication();
        return jdbcVolunteerApplicationDao.getVolunteerApplicationById(volunteerApplication.getApplicationID());
    }

    @GetMapping(path = "/pendingappslist")
    public List<VolunteerApplication> getAllPendingApps() {
        return jdbcVolunteerApplicationDao.getAllApps();
    }

    @RequestMapping(path = "/update-app-status", method = RequestMethod.PUT)
    public void approveAppStatus(@RequestBody VolunteerApplication volunteer) {
        jdbcVolunteerApplicationDao.approveAppStatus(volunteer);
    }

    @RequestMapping(path = "/volunteerapplication", method = RequestMethod.POST)
    public VolunteerApplication saveNewForm(@RequestBody VolunteerApplication volunteerApplication) {
        return jdbcVolunteerApplicationDao.saveNewForm(volunteerApplication);
        //TODO is this what we put for saveNewForm() params?
    }

}
