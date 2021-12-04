import axios from 'axios';

export default {

    // just putting this in here to have something so it's not angry
    displayPets() {
        return axios.get('/pets')
    },

}