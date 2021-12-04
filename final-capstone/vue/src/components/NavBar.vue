<template>
  <div id="nav">
    <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
    <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
      >Logout</router-link
    >
    <login />
  </div>
</template>

<script>
import Login from "@/views/Login.vue";

export default {
  components: {
    Login,
  },
};
</script>

<style>
</style>