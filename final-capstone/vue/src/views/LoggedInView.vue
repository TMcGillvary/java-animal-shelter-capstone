<template>
  <div id="logged-in-form">
    <router-link v-bind:to="{ name: 'add-pet' }" class="links"
      >Add Pet</router-link
    >
    <router-link v-bind:to="{ name: 'update-pet' }" class="links"
      >Update Pet</router-link
    >
    <router-link v-bind:to="{ name: 'volunteer-directory' }" class="links"
      >Volunteer Directory</router-link
    >
  </div>
</template>

<script>
export default {};
</script>

<style>
</style>