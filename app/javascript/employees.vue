<template>
  <div>
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
      console.log(response);
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