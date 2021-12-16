<template>
  <div class="pending-volunteer-list">
    <header-area />
    <logged-in-view />
    <div class="container">
      <div class="status-message success" v-show="message !== ''">
        {{ message }}
      </div>
      <table id="tblUsers">
        <thead>
          <tr>
            <!-- <th>&nbsp;</th> -->
            <th class="row-name">Volunteer Name</th>
            <th class="row-email">Email Address</th>
            <th class="row-phone">Phone #</th>
            <th class="row-desc">Reason For Applying</th>
            <th class="row-status">Status</th>
            <th class="row-action">Actions</th>
          </tr>
        </thead>
        <tbody>
          <!-- <tr> -->
          <!-- <td>
              <input
                type="checkbox"
                id="selectAll"
                v-model="allSelected"
                v-on:click="toggleAllCheckboxes()"
              /> 
            </td> -->
          <!-- None of this is working right now... leaving to come back to later -->
          <!--
          <td>
            <input
              type="text"
              id="firstNameFilter"
              v-model="filter.firstName"
            />
          </td>
          <td>
            <input type="text" id="lastNameFilter" v-model="filter.lastName" />
          </td>
          <td>
            <input type="text" id="usernameFilter" v-model="filter.username" />
          </td>
          <td>
            <input type="text" id="emailFilter" v-model="filter.emailAddress" />
          </td>
          <td>
            <select id="statusFilter" v-model="filter.status">
              <option value>Show All</option>
              <option value="Active">Active</option>
              <option value="Disabled">Disabled</option>
            </select>
          </td>
          <td>&nbsp;</td>
          -->
          <!-- </tr> -->

          <tr
            v-for="volunteer in filteredLists"
            v-bind:key="volunteer.applicationID"
          >
            <!-- <td>
               <input
                type="checkbox"
                v-bind:id="volunteer.applicationID"
                v-bind:value="volunteer.applicationID"
                v-model="selectedIDs"
                v-bind:checked="{
                  isChecked: selectedIDs.includes(volunteer.applicationID),
                }"
                v-bind:change="updateCheckboxes()"
              />
            </td> -->
            <td>{{ volunteer.name }}</td>
            <td>{{ volunteer.email }}</td>
            <td>{{ volunteer.phone }}</td>
            <td>{{ volunteer.description }}</td>
            <td>{{ volunteer.applicationStatus }}</td>
            <td>
              <!-- Approve the App -->

              <button class="approve" v-on:click="approveApp(volunteer)">
                Approve
              </button>

              <!-- Deny the App (code not complete) -->
              <button class="deny" v-on:click="denyApp(volunteer)">Deny</button>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Approve/Deny All Buttons -->
      <!-- <div class="all-actions">
       this code is incomplete, needs finished 
        <button
          :disabled="actionButtonDisabled"
          v-on:click="approveSelectedApps()"
        >
          Approve Pending Apps
        </button>
       this code is incomplete, needs finished 
        <button
          :disabled="actionButtonDisabled"
          v-on:click="denySelectedApps()"
        >
          Deny Pending Apps
        </button>
      </div> -->
    </div>

    <footer-area />
  </div>
</template>

<script>
import HeaderArea from "@/components/HeaderArea.vue";
import appService from "@/services/ApplicationService.js";
import FooterArea from "@/components/FooterArea.vue";
import authService from "../services/AuthService";
import LoggedInView from "../views/LoggedInView.vue";

export default {
  components: { HeaderArea, FooterArea, LoggedInView },

  name: "pending-volunteer-list",
  data() {
    return {
      // this is to toggle the select all/unselect all
      allSelected: false,
      // this is to select apps to approve/deny
      selectedIDs: [],
      message: "",
    };
  },
  created() {
    appService.getPendingApplications().then((response) => {
      this.$store.state.apps = response.data;
    });
  },
  methods: {
    approveApp(volunteer) {
      // this is to allow code to compile, won't be in final code
      // fill in code here for approving app
      this.register(volunteer);
      appService.approveApp(volunteer).then((response) => {
        if (response.status === 200) {
          document.location.reload(true);
          this.message = "Successfully approved application!";
        } else {
          // fail!
        }
      });

      // mark application as approved and remove from pending list (this means code will probably need fixed to only show if status is pending)
    },

    denyApp(volunteer) {
      appService.denyApp(volunteer).then((response) => {
        if (response.status === 200) {
          document.location.reload(true);
          this.message = "Successfully denied application!";
        } else {
          //fail
        }

        // fill in code here for denying app
      });
    },

    // approveSelectedApps() {
    //   // fill in code here for approving all selected apps
    // },

    // denySelectedApps() {
    //   // fill in code here for denying all selected apps
    // },

    toggleAllCheckboxes() {
      this.allSelected = !this.allSelected;
      this.selectedIDs = [];
      const apps = this.$store.state.apps;

      if (this.allSelected) {
        apps.forEach((volunteer) => {
          this.selectedIDs.push(volunteer.applicationID);
        });
      }
    },

    updateCheckboxes() {
      const apps = this.$store.state.apps;
      if (this.selectedIDs.length == apps.length) {
        this.allSelected = true;
      } else {
        this.allSelected = false;
      }
    },

    register(volunteer) {
      const newUser = {
        username: volunteer.email,
        password: "password",
        confirmPassword: "password",
        role: "user",
        full_name: volunteer.name,
        email: volunteer.email,
        phone: volunteer.phone,
        has_logged_in: false,
      };
      if (newUser.password != newUser.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(newUser)
          .then((response) => {
            if (response.status == 201) {
              this.message = "Successfully approved application!";
              // success!
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },

  computed: {
    // grey out buttons unless row is checkmarked
    actionButtonDisabled() {
      if (this.selectedIDs.length != 0) {
        return false;
      } else {
        return true;
      }
    },

    filteredLists() {
      let filteredVolunteers = this.$store.state.apps.filter(
        (volunteer) => volunteer.applicationStatus === "Pending"
      );
      return filteredVolunteers;
    },
  },
};
</script>

<style scoped>
/* Styling for Pending Application */

table {
  margin: 20px auto 20px;
  width: 75%;
  table-layout: fixed;
}

th {
  text-transform: uppercase;
  text-align: left;
}

td {
  padding: 10px 10px 10px 0px;
}

/* Styling for each column */

.row-name {
  width: 15%;
}

.row-email {
  width: 18%;
}

.row-phone {
  width: 10%;
}

.row-desc {
  width: 35%;
}

.row-status {
  width: 6%;
}

/* Styling for the approve/deny all buttons, currently unused */

button {
  margin-right: 5px;
}

.all-actions {
  margin-bottom: 40px;
  text-align: center;
}

.btn.save {
  margin: 20px;
  float: right;
}
</style>