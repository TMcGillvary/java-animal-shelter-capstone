package com.techelevator.volunteerapplicationdao;

import com.techelevator.volunteerapplicationmodel.VolunteerApplication;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcVolunteerApplicationDao implements VolunteerApplicationDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcVolunteerApplicationDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<VolunteerApplication> getAllApps() {
        List<VolunteerApplication> apps = new ArrayList<>();
        String sql = "SELECT app.application_id, app_s.application_status, app.name, app.email, app.phone, app.description " +
                " FROM applications AS app " +
                " JOIN application_status AS app_s ON app.application_status_id = app_s.application_status_id;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            VolunteerApplication volunteer = mapRowForPending(results);
            apps.add(volunteer);
        }
        return apps;
    }

    /**
     * Update an application status to be approved in the DB
     * @param volunteer the application to update
     */
    @Override
    public void approveAppStatus(VolunteerApplication volunteer) {
        String sql = "UPDATE applications SET application_status_id = " +
                " (SELECT application_status_id FROM application_status WHERE application_status = 'Approved') " +
                " WHERE application_id = ?;";
        jdbcTemplate.update(sql, volunteer.getApplicationID());
    }

    @Override
    public VolunteerApplication getVolunteerApplicationById(int newId){
        String sql = "SELECT application_id, application_status_id, name, email, phone, description" +
                " FROM applications" +
                " WHERE application_id = ?;";
        VolunteerApplication application = null;
        SqlRowSet applicationResults =this.jdbcTemplate.queryForRowSet(sql, newId);
            if (applicationResults.next()) {
                application = mapRowToVolunteerApplication(applicationResults);
            }
            return application;

    }

    @Override
    public VolunteerApplication saveNewForm(VolunteerApplication newVolunteerApplication) {
        String sql = "INSERT INTO applications (application_status_id, name, email, phone, description) " +
                "VALUES(1, ?, ?, ?, ?) RETURNING application_id;";
        //TODO try catch?? want to keep from having null values
         Integer newId = jdbcTemplate.queryForObject(sql, Integer.class, newVolunteerApplication.getName(), newVolunteerApplication.getEmail(),
                 newVolunteerApplication.getPhone(), newVolunteerApplication.getDescription());

         return getVolunteerApplicationById(newId);
    }

    private VolunteerApplication mapRowToVolunteerApplication(SqlRowSet results) {
        VolunteerApplication volunteerApplication = new VolunteerApplication();
        volunteerApplication.setApplicationID(results.getInt("application_id"));
        volunteerApplication.setApplicationStatusID(results.getInt("application_status_id"));
        volunteerApplication.setName(results.getString("name"));
        volunteerApplication.setEmail(results.getString("email"));
        volunteerApplication.setPhone(results.getString("phone"));
        volunteerApplication.setDescription(results.getString("description"));
        return volunteerApplication;
    }

    private VolunteerApplication mapRowForPending(SqlRowSet results) {
        VolunteerApplication volunteerApplication = new VolunteerApplication();
        volunteerApplication.setApplicationID(results.getInt("application_id"));
        volunteerApplication.setApplicationStatus(results.getString("application_status"));
        volunteerApplication.setName(results.getString("name"));
        volunteerApplication.setEmail(results.getString("email"));
        volunteerApplication.setPhone(results.getString("phone"));
        volunteerApplication.setDescription(results.getString("description"));
        return volunteerApplication;
    }


}
