<template>
  <div class="petcard">
    <h2>{{ pet.name }}</h2>
    <div class="img-container">
      <img v-bind:src="pet.pic" />
    </div>
    <p>{{ pet.description }}</p>
    <p>Type: {{ pet.pet_type }}</p>
    <p>Breed: {{ pet.breed }}</p>

    <router-link
      tag="button"
      class="button-style"
      v-if="$store.state.token != ''"
      v-bind:to="{ name: 'update-pet', params: { id: pet.pet_id } }"
      >Edit Pet</router-link
    >
  </div>
</template>

<script>
export default {
  name: "pet-card",
  props: ["pet"],
};
</script>

<style>
.img-container {
  width: 100%;
  height: 250px;
  overflow: hidden;
}

.img-container img {
  width: 80%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}
</style>