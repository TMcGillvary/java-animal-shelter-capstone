<template>
  <div class="home">
    <header-area />
    <h1>Home</h1>
    <!-- <p>You must be authenticated to see this</p> -->
    <p>now you can do it without logging in(?)</p>
    <pets-display />
  </div>
</template>

<script>
import HeaderArea from "@/components/HeaderArea.vue";
import PetsDisplay from "@/components/AvailablePetsDisplay.vue";

export default {
  name: "home",
  components: {
    HeaderArea,
    PetsDisplay,
  },
};
</script>
