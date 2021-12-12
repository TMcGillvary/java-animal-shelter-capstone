<template>
  <div class="pending-volunteer-list">
    <header-area />
    <div class="container">
      <table id="tblUsers">
        <thead>
          <tr>
            <th>&nbsp;</th>
            <th>Volunteer Name</th>
            <th>Email Address</th>
            <th>Phone #</th>
            <th>Reason For Applying</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <input
                type="checkbox"
                id="selectAll"
                v-model="allSelected"
                v-on:click="toggleAllCheckboxes()"
              />
            </td>
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
          --></tr>

          <tr
            v-for="volunteer in $store.state.apps"
            v-bind:key="volunteer.applicationID"
          >
            <td>
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
            </td>
            <td>{{ volunteer.name }}</td>
            <td>{{ volunteer.email }}</td>
            <td>{{ volunteer.phone }}</td>
            <td>{{ volunteer.description }}</td>
            <td>{{ volunteer.applicationStatus }}</td>
            <td>
              <!-- Approve the App (code not complete) -->
              <button class="approve" v-on:click="approveApp(id)">
                Approve
              </button>
              <!-- Deny the App (code not complete) -->
              <button class="deny" v-on:click="denyApp(id)">Deny</button>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Approve/Deny All Buttons -->
      <div class="all-actions">
        <!-- this code is incomplete, needs finished -->
        <button
          :disabled="actionButtonDisabled"
          v-on:click="approveSelectedApps()"
        >
          Approve Pending Apps
        </button>
        <!-- this code is incomplete, needs finished -->
        <button
          :disabled="actionButtonDisabled"
          v-on:click="denySelectedApps()"
        >
          Deny Pending Apps
        </button>
      </div>
    </div>

    <footer-area />
  </div>
</template>

<script>
import HeaderArea from "@/components/HeaderArea.vue";
import appService from "@/services/ApplicationService.js";
import FooterArea from "@/components/FooterArea.vue";

export default {
  components: { HeaderArea, FooterArea },

  name: "pending-volunteer-list",
  data() {
    return {
      // this is to toggle the select all/unselect all
      allSelected: false,
      // this is to select apps to approve/deny
      selectedIDs: [],
    };
  },
  created() {
    appService.getPendingApplications().then((response) => {
      this.$store.state.apps = response.data;
    });
  },
  methods: {
    approveApp(id) {
      // this is to allow code to compile, won't be in final code
      return id;
      // fill in code here for approving app
      // if approved, we are going to register the volunteer as a user using the register function provided in the code
      // this will add the details from the volunteer form into the users table for that user and create a temp password
      // mark application as approved and remove from pending list (this means code will probably need fixed to only show if status is pending)
    },

    denyApp(id) {
      // this is to allow code to compile, won't be in final code
      return id;
      // fill in code here for denying app
    },

    approveSelectedApps() {
      // fill in code here for approving all selected apps
    },

    denySelectedApps() {
      // fill in code here for denying all selected apps
    },

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
  },
};
</script>

<style scoped>
/* styling all stolen from homework, will need fixed! 

I am pretty sure I want to change all of this to a grid or a flexbox, gonna see if vue has a preference or whether it's better to leave as is */
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