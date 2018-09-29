<template>
  <div class="lib">
    <div v-for="item in original_katbib2s">
      <h3>{{item.name}}</h3>
      <hr />
      <div v-for="(library, index) in item.libraries">
        {{library.name}}
      </div>
    </div>
     <!--  <div class="itemrev" v-for="(review, index) in reviews" v-bind:key="index" >         
          <div class="subj"><p>&laquo;{{review.subj}}&raquo;</p></div>
          <div class="name">{{review.name}}</div>        
      </div>
      -->
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: ["original_katbib2s"],

  data: function () {
    return {
       katbib2s: this.original_katbib2s,
       
    }
  },
  watch: {

  },
  methods: {
    fetchNews: function() {
      axios.get('/libraries')
      .then((response) => {
        this.libraries = response.data
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
  lost-masonry-column: 1/3 18px;
  text-align: justify;
   @media (--only-medium-screen) {
    lost-masonry-column: 1/2 18px;
  }
  @media (--only-small-screen) {
    lost-masonry-column: 1/1;

  }
  @media (--only-xsmall-screen) {
    lost-masonry-column: 1/1;
  }
  background: $floralwhite;
  padding: 0em 0.6em 1em;
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