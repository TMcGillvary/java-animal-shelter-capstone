<template>
  <div id="nav-bar-flex">
    <login />

    <div class="links-area">
      <router-link v-bind:to="{ name: 'home' }" class="links">Home</router-link>

      &nbsp;|&nbsp;

      <router-link v-bind:to="{ name: 'adopted-pets' }" class="links"
        >Adopted Pets</router-link
      >

      &nbsp;|&nbsp;

      <router-link v-bind:to="{ name: 'volunteer-form' }" class="links"
        >Volunteer</router-link
      >
      &nbsp;

      <div class="inline" v-if="$store.state.token != ''">
        |&nbsp;
        <router-link v-bind:to="{ name: 'logout' }" class="links"
          >Logout</router-link
        >
      </div>
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
#nav-bar-flex {
  display: flex;
  flex-direction: column;
  flex-wrap: nowrap;
  align-content: center;
  justify-content: space-between;
  align-items: center;
  height: 150px;
}

.links-area {
  font-size: 1.5rem;
}

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