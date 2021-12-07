<template>
  <div id="volunteer-form-page">
    <header-area />
    <h1>Volunteer With Us!</h1>

    <form class="new-volunteer-form" v-on:submit.prevent="submitForm">
      <div class="form-group">
        <div class="status-message success" v-show="message !== ''">
          {{ message }}
        </div>
      </div>
      <div class="form-group">
        <label for="name">Volunteer Name:</label>
        <input
          id="name"
          type="text"
          class="form-box"
          v-model="application.name"
          autocomplete="off"
        />
      </div>
      <div class="form-group">
        <label for="email">Volunteer Email Address:</label>
        <input
          id="email"
          type="text"
          class="form-box"
          v-model="application.email"
          autocomplete="off"
        />
      </div>
      <div class="form-group">
        <label for="phone">Best Phone Number:</label>
        <input
          id="phone"
          type="text"
          class="form-box"
          v-model="application.phoneNumber"
          autocomplete="off"
        />
      </div>
      <div class="form-group">
        <label for="reason">Why Should We Hire You?</label>
        <textarea
          id="reason"
          class="form-box"
          v-model="application.reasonWhy"
          autocomplete="off"
        />
      </div>
      <div class="form-buttons">
        <button class="btn btn-submit">Submit</button>
        <button
          class="btn btn-cancel"
          v-on:click.prevent="cancelForm"
          type="cancel"
        >
          Cancel
        </button>
      </div>
    </form>

    <footer-area />
  </div>
</template>

<script>
import HeaderArea from "./HeaderArea.vue";
import appService from "@/services/ApplicationService.js";
import FooterArea from "./FooterArea.vue";

export default {
  name: "VolunteerFormPage",
  components: {
    HeaderArea,
    FooterArea,
  },
  data() {
    return {
      application: {
        name: "",
        email: "",
        phoneNumber: "",
        reasonWhy: "",
      },
      message: "",
    };
  },
  methods: {
    submitForm() {
      const newApplication = {
        name: this.application.name,
        email: this.application.email,
        phoneNumber: this.application.phoneNumber,
        reasonWhy: this.application.reasonWhy,
      };

      appService.submitForm(newApplication).then((response) => {
        if (response.status === 201) {
          this.message = "Form successfully submitted!";
        }
      });
    },
    cancelForm() {
      this.application = {};
    },
  },
};
</script>

<style>
h1 {
  text-align: center;
}

.form-group {
  text-align: left;
  width: 80%;
  margin: 10px auto 10px;
}

.form-buttons {
  text-align: center;
  width: 80%;
  margin: 2em auto 2em;
}

label {
  display: inline-block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}
.form-box {
  display: block;
  width: 99.5%;
  height: 30px;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
textarea.form-box {
  height: 75px;
  font-family: Arial, Helvetica, sans-serif;
}
select.form-control {
  width: 20%;
  display: inline-block;
  margin: 10px 20px 10px 10px;
}

.btn-submit {
  color: #2d292c;
  cursor: pointer;
  background: linear-gradient(0.25turn, #e6d0f7, #d7d1dd);
  border-radius: 15px;
  margin-right: 15px;
  width: 150px;
  height: 50px;
  font-size: 1.5rem;
  font-family: "Quicksand", sans-serif;
  font-weight: bold;
}

.btn-cancel {
  color: #fff;
  cursor: pointer;
  background-color: #dc3545;
  border-radius: 15px;
  margin-left: 15px;
  width: 150px;
  height: 50px;
  font-size: 1.5rem;
  font-family: "Quicksand", sans-serif;
  font-weight: bold;
}

.status-message {
  display: block;
  border-radius: 5px;
  font-weight: bold;
  font-size: 1rem;
  text-align: center;
  padding: 10px;
  margin-bottom: 10px;
}

.status-message.success {
  background-color: #90ee90;
  margin: auto;
  padding: 0.375rem 0.75rem;
}
</style>