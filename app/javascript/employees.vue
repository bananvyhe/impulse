<template>
  <div>
    <ul v if="employee && employee.length">
      <li v-for="item of employee" >
        <p><strong>{{item.name}}</strong></p>
        <p>
          {{item.desc}}
        </p>
      </li>
    </ul>
  {{employee}}
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      employee: ''
    }
  },
  created() {
    axios.get('/employees')
    .then((response) => {
      this.employee = response.data;
      console.log(this.employee);
    })
    .catch(function (error) {
      console.log(error);
    }); 
    },
  methods: {
  }
}
</script>

<style scoped>
</style>