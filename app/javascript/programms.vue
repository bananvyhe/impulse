<template>
  <div>
  	<div v-for="programm of programms">
  		<div class="subj"><p>&laquo;{{programm.name}}&raquo;</p></div>
  		<div class="name">{{programm.desc}}</div>
  	</div>
  </div>
</template>

<script>
import axios from 'axios'
 
export default {
  data: function () {
    return {
      programms: [],
       
    }
  },
  watch: {

  },
  methods: {
    fetchNews: function() {
      axios.get('/programms')
      .then((response) => {
        this.programms = response.data
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