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

<style scoped>
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

table {
  margin: 20px auto 20px;
}

th {
  text-transform: uppercase;
}

td {
  padding: 10px;
}

input,
select {
  font-size: 16px;
}

form {
  margin: 20px;
  width: 350px;
}

.field {
  padding: 10px 0px;
}

label {
  width: 140px;
  display: inline-block;
}
</style>