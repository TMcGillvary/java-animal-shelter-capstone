<template>
  <div>
    <header-area />
    <div class="container">
      <table id="tblUsers">
        <thead>
          <tr>
            <th>Employee Name</th>
            <th>Email Address</th>
            <th>Phone #</th>
            <th>Role</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in $store.state.users" v-bind:key="user.id">
            <td>{{ user.full_name }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.phone }}</td>
            <td>{{ user.authorities.name }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <footer-area />
  </div>
</template>

<script>
import userService from "@/services/UserService.js";
import HeaderArea from "@/components/HeaderArea.vue";
import FooterArea from "@/components/FooterArea.vue";

export default {
  components: { HeaderArea, FooterArea },
  created() {
    userService.displayDirectory().then((response) => {
      this.$store.state.users = response.data;
    });
  },
};
</script>


<style>
</style>