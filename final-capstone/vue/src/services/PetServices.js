import axios from 'axios';

export default {

    // Get List of Pets for Home
    displayPets() {
        return axios.get('/pets')
    },

    addPet(newPet) {
        return axios.post('/addnewpet', newPet)
    },

    updatePet(newPet) {
        return axios.put('/updatepetlisting', newPet)
    },
    // // do we need to map petPetById?
    // getPetById()
    adoptPet(pet) {
        return axios.put('/adoptpet', pet)
    },
}