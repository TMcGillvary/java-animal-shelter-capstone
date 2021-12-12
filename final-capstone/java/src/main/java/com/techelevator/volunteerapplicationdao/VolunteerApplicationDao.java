package com.techelevator.volunteerapplicationdao;

import com.techelevator.volunteerapplicationmodel.VolunteerApplication;

import java.util.List;

public interface VolunteerApplicationDao {

    public VolunteerApplication saveNewForm(VolunteerApplication volunteerApplication);

    public VolunteerApplication getVolunteerApplicationById(int newId);

    public List<VolunteerApplication> getAllApps();

}