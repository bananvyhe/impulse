<template>
  <div>
  	<div v-for="review of reviews">
  		<div class="subj"><p>&laquo;{{review.subj}}&raquo;</p></div>
  		<div class="name">{{review.name}}</div>
  	</div>
  </div>
</template>

<script>
import axios from 'axios'
 
export default {
  data: function () {
    return {
      reviews: [],
       
    }
  },
  watch: {

  },
  methods: {
    fetchNews: function() {
      axios.get('/reviews')
      .then((response) => {
        this.reviews = response.data
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
.subj {
	font-style: italic; 
	font-weight: 300;
	padding: 1em 2em 0em 2em;
	text-align: justify;

} 
.name {
	text-align: right;
	padding-right: 2em;
	padding-bottom: 1em;
}
 
</style>