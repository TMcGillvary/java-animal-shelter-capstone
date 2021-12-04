<template>
  <div id="head1">
    <div class="header-image">
      <img src="@/assets/animal-shelter.png" />
    </div>
    <div class="navigation">
      <nav-bar />
    </div>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar.vue";

export default {
  components: {
    NavBar,
  },
};
</script>

<style scoped>
.header-image {
  grid-area: logo;
}

.header-image img {
  width: 250px;
  height: 100%;
}

.navigation {
  grid-area: links;
}

#head1 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
    "logo links"
    "logo links";
}
</style>