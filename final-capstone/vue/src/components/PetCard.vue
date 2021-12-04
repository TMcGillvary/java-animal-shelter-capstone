<template>
  <div class="petcard">
    <h1>{{ pet.name }}</h1>
    <img v-bind:src="pet.pic" />
    <p>{{ pet.description }}</p>
  </div>
</template>

<script>
export default {
  name: "pet-card",
  props: ["pet"],
};
</script>

<style>
</style>