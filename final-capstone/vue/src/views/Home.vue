<template>
  <div id="home">
    <div class="head2">
      <header-area />
    </div>
    <div class="pets-area">
      <h1>Check Out Our Pets!!</h1>
      <pets-display />
    </div>
    <div class="volunteer">
      <volunteer-form />
    </div>
    <div class="footer2">
      <footer-area />
    </div>
  </div>
</template>

<script>
import HeaderArea from "@/components/HeaderArea.vue";
import PetsDisplay from "@/components/AvailablePetsDisplay.vue";
import VolunteerForm from "@/views/VolunteerForm.vue";
import FooterArea from "@/components/FooterArea.vue";

export default {
  name: "home",
  components: {
    HeaderArea,
    PetsDisplay,
    VolunteerForm,
    FooterArea,
  },
};
</script>

<style scoped>
/*
Grid Layout
*/
.head2 {
  grid-area: header;
}

.pets-area {
  grid-area: pet-display;
}

.volunteer {
  grid-area: vform;
}

.footer2 {
  grid-area: footer;
}

/* 
Desktop Layout
*/

#home {
  text-align: center;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
    "header header"
    "pet-display pet-display"
    "vform vform"
    "footer footer";
}
</style>