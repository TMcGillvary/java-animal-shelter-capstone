<template>
  <div class="pets-display">
    <pet-card
      v-for="pet in $store.state.pets"
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
};
</script>

<style>
</style>