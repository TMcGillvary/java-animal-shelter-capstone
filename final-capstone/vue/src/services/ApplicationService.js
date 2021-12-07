import axios from 'axios';

export default {

    // add new Volunteer Form to Database
    // TODO: insert link from server side
    submitForm(application) {
        return axios.post("/", application)
    }
    
}