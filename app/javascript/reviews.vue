<template>
  <div>
     <transition-group name="fade">
    	<div v-for="(review, index) in reviews" v-bind:key="index">
    		<div class="subj"><p>&laquo;{{review.subj}}&raquo;</p></div>
    		<div class="name">{{review.name}}</div>
    	</div>
  </transition-group>
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
  @media (--only-xsmall-screen) {
    padding: 1em 0.5em 0em 0.5em;
  }

} 
.name {
	text-align: right;
	padding-right: 2em;
	padding-bottom: 1em;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}  
</style>