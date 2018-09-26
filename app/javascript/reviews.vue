<template>
  <div class="lostwidth">
    <transition-group name="fade">
    	<div v-for="(review, index) in reviews" v-bind:key="index" class="itemrev">
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
.itemrev{
  
  @media (--only-1600more-screen) {
    lost-column: 1/3 3 0.5em;
  }
  @media (--only-medium-screen) {
    lost-column: 1/3 3 0.5em;
  }
  @media (--only-small-screen) {
    lost-column: 1/2 2 0.5em;
  }
}
.lostwidth{
  lost-center: 1200px;
}
.subj {
	font-style: italic; 
	font-weight: 300;
	padding: 1em 1em 0em 1em;
	text-align: justify;
  @media (--only-xsmall-screen) {
    padding: 1em 0.5em 0em 0.5em;
  }

} 
.name {
	text-align: right;
	padding-right: 2em;
	margin-top: -1em;
  padding-bottom: 1em;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}  
</style>