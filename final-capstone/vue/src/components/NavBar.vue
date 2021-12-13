<template>
  <div id="nav">
    <login />
    <br />
    <br />
    <br />
    <router-link v-bind:to="{ name: 'home' }" class="links">Home</router-link
    >&nbsp;|&nbsp; <a href="#" class="links">About</a>&nbsp;|&nbsp;
    <router-link v-bind:to="{ name: 'volunteer-form' }" class="links"
      >Volunteer</router-link
    >&nbsp;
    <div class="inline" v-if="$store.state.token != ''">
      |&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" class="links"
        >Logout</router-link
      >
    </div>
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
a.links {
  text-decoration: none;
  color: #000;
}

a:hover {
  color: #6b23a8;
  font-weight: bold;
  text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff,
    1px 1px 0 #fff;
}

a.router-link-active {
  color: #6b23a8;
}

.inline {
  display: inline-block;
}
</style>