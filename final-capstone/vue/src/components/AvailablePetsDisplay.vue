<template>
  <div id="pets-display">
    <pet-card
      id="pet-card"
      v-for="pet in filteredList"
      v-bind:key="pet.id"
      v-bind:pet="pet"
    />
  </div>
</template>

<script>
import petServices from "@/services/PetServices.js";
import PetCard from "@/components/PetCard.vue";

export default {
  components: {
    PetCard,
  },
  created() {
    petServices.displayPets().then((response) => {
      this.$store.state.pets = response.data;
    });
  },
  computed: {
    filteredList() {
      let adoptablePets = this.$store.state.pets.filter(
        (pet) => pet.is_adoptable === true
      );
      return adoptablePets;
    },
  },
};
</script>

<style>
#pets-display {
  text-align: center;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
</style>