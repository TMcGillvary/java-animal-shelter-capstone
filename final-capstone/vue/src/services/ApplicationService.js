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
        return axios.put("/update-app-status", volunteer);
    }

}