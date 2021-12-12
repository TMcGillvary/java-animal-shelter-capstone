<template>
  <div id="logged-in-form">
    <router-link v-bind:to="{ name: 'add-pet' }" class="links"
      >Add Pet</router-link
    >
    <router-link v-bind:to="{ name: 'volunteer-directory' }" class="links"
      >Volunteer Directory</router-link
    >
  </div>
</template>
<!--Not sure what to add for export -ang-->
<script>
export default {};
</script>

<style>
</style>