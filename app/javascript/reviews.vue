<template>
  <div class="lostwidth">
     
    	<div class="itemrev" v-for="(review, index) in reviews" v-bind:key="index" >
         
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
    this.fetchNews();

  },
  mounted() {
    
  },
  updated(){ 
    $('.lostwidth').masonry({
      itemSelector: '.itemrev',
      columnWidth: '.itemrev',
      percentPosition: true
    });
  },
  beforeUpdate() {
  }
} 

</script>

<style scoped>
@import "stylesheets/_variables";
 
.lostwidth{
  /*lost-utility: clearfix;*/
   
  lost-masonry-wrap: no-flex;
 
}
.itemrev{
  lost-masonry-column: 1/3;
  text-align: justify;
   @media (--only-medium-screen) {
    lost-masonry-column: 1/2;
  }
  @media (--only-small-screen) {
    lost-masonry-column: 1/1;

  }
  @media (--only-xsmall-screen) {
    lost-masonry-column: 1/1;
  }
  background: $floralwhite;
  padding-bottom: 1em;
  margin-top: 1em;
}

.subj {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
	font-style: italic; 
	font-weight: 300;
  color: color( $onyx  tint(10%));
	padding: 1em 1em 0em 1em;
	text-align: justify;
  @media (--only-xsmall-screen) {
    padding: 1em 0.5em 0em 0.5em;
  }

} 
.name {
	text-align: right;
	padding-right: 1em;
	margin-top: -1em;
  
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}  
</style>