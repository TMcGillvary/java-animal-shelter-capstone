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
          <!-- this will need replaced with the actual database list -->
          <tr v-for="volunteer in testVolunteerApps" v-bind:key="volunteer.id">
            <td>
              <input
                type="checkbox"
                v-bind:id="volunteer.id"
                v-bind:value="volunteer.id"
                v-model="selectedIDs"
                v-bind:checked="{
                  isChecked: selectedIDs.includes(volunteer.id),
                }"
                v-bind:change="updateCheckboxes()"
              />
            </td>
            <td>{{ volunteer.name }}</td>
            <td>{{ volunteer.email }}</td>
            <td>{{ volunteer.phone }}</td>
            <td>{{ volunteer.description }}</td>
            <td>{{ volunteer.status }}</td>
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
// import appService from "@/services/ApplicationService.js";
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
      // this is test data, will be removed once hooked to database
      testVolunteerApps: [
        {
          id: 1,
          name: "Peggy Sue",
          email: "peggy.sue@gmail.com",
          phone: "888-867-5309",
          description: "I am only a test",
          status: "Pending",
        },
        {
          id: 2,
          name: "Johnny Cash",
          email: "cash4cash@gmail.com",
          phone: "888-867-5309",
          description: "I'm a rock star",
          status: "Pending",
        },
      ],
    };
  },
  methods: {
    approveApp(id) {
      // this is to allow code to compile, won't be in final code
      return id;
      // fill in code here for approving app
      // insert their app details into user details table and return the user_details_id
      // second method passing in the user details id to create a login with a temp password of password
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
      // this code will need fixed once test data is removed
      if (this.allSelected) {
        this.testVolunteerApps.forEach((volunteer) => {
          this.selectedIDs.push(volunteer.id);
        });
      }
    },

    updateCheckboxes() {
      // this code will need fixed once test data is removed
      if (this.selectedIDs.length == this.testVolunteerApps.length) {
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

<style>
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