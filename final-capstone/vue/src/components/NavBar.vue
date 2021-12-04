<template>
  <div id="nav">
    <login />

    <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
    <a href="#">About</a>&nbsp;|&nbsp;
    <a href="#">Volunteer</a>&nbsp;|&nbsp;
    <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"
      >Logout</router-link>
    <router-link :to="{ name: 'register' }" v-if="$store.state.token == ''">Need an account?</router-link>
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