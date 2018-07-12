<template>
  <div>
  	<el-collapse v-model="activeName" accordion>
		  <el-collapse-item v-for="programm of programms" 
        :title="programm.name"  
        :name = "programm.id">
		    <div class="subj"><p>&laquo;{{programm.name}}&raquo;</p></div>
  		<div class="name"><span v-html="programm.desc"></span></div>
		  </el-collapse-item>
		</el-collapse>
  </div>
</template>
<script>
import axios from 'axios'
let pathname = document.location.pathname;
export default {
  data: function () {
    return {
      pathname: pathname,
      programms: [],
      activeName:  '' 
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