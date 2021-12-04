<template>
  <div class="petcard">
    <h1>{{ pet.name }}</h1>
    <div class="img-container">
      <img v-bind:src="pet.pic" />
    </div>
    <p>{{ pet.description }}</p>
    <p>Type: {{ pet.type }}</p>
    <p>Breed: {{ pet.breed }}</p>
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