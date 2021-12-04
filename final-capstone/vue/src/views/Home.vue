<template>
  <div class="home">
    <nav-bar />
    <h1>Home</h1>
    <!-- <p>You must be authenticated to see this</p> -->
    <p>now you can do it without logging in(?)</p>
    <pet-card
      v-for="pet in $store.state.pets"
      v-bind:key="pet.id"
      v-bind:pet="pet"
    />
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";
import PetCard from "@/components/PetCard.vue";

export default {
  name: "home",
  components: {
    NavBar,
    PetCard,
  },
};
</script>
