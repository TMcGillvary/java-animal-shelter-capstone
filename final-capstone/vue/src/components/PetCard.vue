<template>
  <div class="petcard">
    <h2>{{ pet.name }}</h2>
    <div class="img-container">
      <img v-bind:src="pet.pic" />
    </div>
    <p>{{ pet.description }}</p>
    <p>Type: {{ pet.pet_type }}</p>
    <p>Breed: {{ pet.breed }}</p>

    <button
      type="button"
      class="confetti-button"
      @click="adoptPet"
      v-if="pet.is_adoptable === true"
    >
      Adopt!
    </button>

    <modal v-show="isModalVisible" @close="closeModal" />

    <router-link
      tag="button"
      class="button-style"
      v-if="$store.state.token != ''"
      v-bind:to="{ name: 'update-pet', params: { id: pet.pet_id } }"
      >Edit Pet</router-link
    >
  </div>
</template>

<script>
import Vue from "vue";
import modal from "@/views/AdoptedModal.vue";
import VueConfetti from "vue-confetti";
import PetService from "@/services/PetServices.js";

Vue.use(VueConfetti);

export default {
  name: "pet-card",
  props: ["pet"],
  mounted() {
    // all the javascript for the confetti button

    var animateButton = function (e) {
      e.preventDefault;
      //reset animation
      e.target.classList.remove("animate");

      e.target.classList.add("animate");
      setTimeout(function () {
        e.target.classList.toggle("animate");
      }, 500);
    };

    var classname = document.getElementsByClassName("confetti-button");

    for (var i = 0; i < classname.length; i++) {
      classname[i].addEventListener("mouseover", animateButton, true);
    }
  },

  // all the code for the modal pop up
  components: {
    modal,
  },

  data() {
    return {
      isModalVisible: false,
    };
  },
  methods: {
    //this is the method to adopt a pet and flips is adoptable
    adoptPet() {
      const pet = {
        pet_id: this.pet.pet_id,
        name: this.pet.name,
        description: this.pet.description,
        is_adoptable: false,
        pic: this.pet.pic,
        breed: this.pet.breed,
        pet_type: this.pet.pet_type,
      };
      PetService.adoptPet(pet)
        .then((response) => {
          if (response.status === 200) {
            this.start();
            this.showModal();
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adopting");
        });
    },

    handleErrorResponse(error, verb) {
      if (error.response) {
        this.message =
          "Error " +
          verb +
          " form. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.message = "Error " + verb + " form. Server could not be reached.";
      } else {
        this.message = "Error " + verb + " form. Request could not be created.";
      }
    },

    //this is the start of the confetti stuff
    start() {
      this.$confetti.start({
        particles: [
          {
            type: "heart",
            colors: ["red", "pink"],
            size: 25,
            dropRate: 20,
          },
          {
            type: "circle",
            colors: [
              "DodgerBlue",
              "OliveDrab",
              "Gold",
              "SlateBlue",
              "lightblue",
              "Violet",
              "PaleGreen",
              "SteelBlue",
              "SandyBrown",
              "Chocolate",
            ],
          },
          {
            type: "rect",
            size: 15,
          },
        ],
        defaultDropRate: 15,
        defaultSize: 10,
        windSpeedMax: 5,
      });
    },

    stop() {
      this.$confetti.stop();
    },
    //this opens and closes the modal and starts and stops confetti
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.stop();
      this.isModalVisible = false;
      document.location.reload(true);
    },
  },
};
</script>

<style>
.img-container {
  width: 100%;
  height: 250px;
  overflow: hidden;
}

.img-container img {
  width: 80%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

/************************************
 All the CSS for the confetti button 
*************************************/

.confetti-button {
  color: #2d292c;
  cursor: pointer;
  background: linear-gradient(0.25turn, #e6d0f7, #d7d1dd);
  border-radius: 15px;
  margin-right: 15px;
  margin-bottom: 1.3em;
  width: 150px;
  height: 50px;
  font-size: 1.5rem;
  font-family: "Quicksand", sans-serif;
  font-weight: bold;

  -webkit-appearance: none;
  appearance: none;

  position: relative;
}

/* .confetti-button.animate:hover {
  transition: transform ease-in 0.5s, box-shadow ease-in 0.1s;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.5);
} */

.confetti-button:focus {
  outline: 0;
}

.confetti-button:before,
.confetti-button:after {
  position: absolute;
  content: "";
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}

.confetti-button:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, transparent 20%, #ff0081 20%, transparent 30%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%,
    10% 10%, 18% 18%;
}

.confetti-button:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%),
    radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}

.confetti-button:active {
  transform: scale(0.9);
  background-color: #e60074;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}

.confetti-button.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}

.confetti-button.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}
@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%,
      40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%,
      50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%,
      50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%,
      70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%,
      105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%,
      110% 10%;
    background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
  }
}
</style>