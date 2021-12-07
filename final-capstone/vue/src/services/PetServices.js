import axios from 'axios';

export default {

    // Get List of Pets for Home
    displayPets() {
        return axios.get('/pets')
    },

}