<template>
  <div>
 		{{users}}

  </div>
</template>

<script>
import axios from 'axios'
 
export default {
  data: function () {
    return {
      users: [],
      totalNews: 0,
      perPage: 4,
      currentPage: 1,
      viewedNews: ''
    }
  },
  watch: {

  },
  methods: {
    fetchNews: function() {
      axios.get('/users')
      .then((response) => {
        this.users = response.data
        console.log(response.data);
         
      })
      .catch(function (error) {
        console.log(error);
      }); 
       
    }
  },
  created() {
    this.fetchNews()
  },
  mounted() {
  },
  updated(){
  },
  beforeUpdate() {
  }
} 
</script>

<style scoped>
@import "stylesheets/_variables";
 
 
</style>