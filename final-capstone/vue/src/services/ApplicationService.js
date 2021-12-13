import axios from 'axios';

export default {

    // add new Volunteer Form to Database

    submitForm(application) {
        return axios.post("/volunteerapplication", application)
    },

    getPendingApplications() {
        return axios.get("/pendingappslist")
    },

    approveApp(volunteer) {
        return axios.put("/approve-app-status", volunteer);
    },

    denyApp(volunteer) {
        return axios.put("/deny-app-status", volunteer);
    }

}