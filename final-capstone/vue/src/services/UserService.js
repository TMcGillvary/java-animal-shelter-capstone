import axios from 'axios';

export default {
    displayDirectory() {
        return axios.get('/volunteerdirectory')
    },

}