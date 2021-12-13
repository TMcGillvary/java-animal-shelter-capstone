<template>
  <div id="logged-in-form" v-if="$store.state.token != ''">
    <router-link
      tag="button"
      v-bind:to="{ name: 'add-pet' }"
      id="add"
      class="button-style"
      >Add Pet</router-link
    >
    <router-link
      tag="button"
      v-bind:to="{ name: 'volunteer-directory' }"
      id="directory"
      class="button-style"
      >Directory</router-link
    >
  </div>
</template>
<!--Not sure what to add for export -ang-->
<script>
export default {};
</script>

<style>
#add {
  grid-area: add;
}

#directory {
  grid-area: directory;
}

#logged-in-form {
  display: grid;
  justify-items: center;
  align-items: center;
  margin-top: 15px;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "add directory";
}
</style>