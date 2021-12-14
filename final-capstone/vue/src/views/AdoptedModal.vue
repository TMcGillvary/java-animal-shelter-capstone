<template>
  <transition name="modal-fade">
    <div class="modal-backdrop">
      <div
        class="modal"
        role="dialog"
        aria-labelledby="modalTitle"
        aria-describedby="modalDescription"
      >
        <!-- <header class="modal-header" id="modalTitle">
          <slot name="header"> This is the default tile! </slot>
          <button
            type="button"
            class="btn-close"
            @click="close"
            aria-label="Close modal"
          >
            x
          </button>
        </header> -->

        <section class="modal-body" id="modalDescription">
          <slot name="body">
            <div>
              <img src="@/assets/congrats1-1.png" />
            </div>
            <div>
              <img src="@/assets/adopt2.png" width="200px" />
            </div>
            <div>
              <button @click="start">Start</button>
              <button @click="stop">Stop</button>
              <button @click="love">Show some love</button>
            </div>
          </slot>
        </section>

        <footer class="modal-footer">
          <slot name="footer"> This is the default footer! </slot>
          <button
            type="button"
            class="btn-green"
            @click="close"
            aria-label="Close modal"
          >
            Close me!
          </button>
        </footer>
      </div>
    </div>
  </transition>
</template>

<script>
import Vue from "vue";
import VueConfetti from "vue-confetti";

Vue.use(VueConfetti);

export default {
  name: "Modal",
  methods: {
    close() {
      this.$emit("close");
    },

    // this is the code for confetti
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

    love() {
      this.$confetti.update({
        particles: [
          {
            type: "heart",
          },
          {
            type: "circle",
          },
        ],
        defaultColors: ["red", "pink", "#ba0000"],
      });
    },
  },
};
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
}

.modal {
  background: rgb(215, 208, 221, 1);
  box-shadow: 2px 2px 20px 1px;
  overflow-x: auto;
  display: flex;
  flex-direction: column;
  width: 75vw;
  height: 75vh;
}

.modal-header,
.modal-footer {
  padding: 15px;
  display: flex;
}

.modal-header {
  position: relative;
  border-bottom: 1px solid #eeeeee;
  color: #4aae9b;
  justify-content: space-between;
}

.modal-footer {
  border-top: 1px solid #eeeeee;
  flex-direction: column;
}

.modal-body {
  position: relative;
  padding: 20px 10px;
}

.btn-close {
  position: absolute;
  top: 0;
  right: 0;
  border: none;
  font-size: 20px;
  padding: 10px;
  cursor: pointer;
  font-weight: bold;
  color: #4aae9b;
  background: transparent;
}

.btn-green {
  color: white;
  background: #4aae9b;
  border: 1px solid #4aae9b;
  border-radius: 2px;
}

.modal-fade-enter,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.5s ease;
}

.modal-backdrop img {
  width: 100%;
  height: 100%;
}
</style>