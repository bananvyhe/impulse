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
    currentPage: function (val) {
      this.newsOutTween();
    },
    viewedNews: function () {
      var self = this;
      function ntween() {
        self.newsTween();
      } 
      setTimeout(ntween, 50);
    }
  },
  methods: {
    fetchNews: function(page) {
      axios.get('/users')
      .then((data) => {
        this.users = data.data
         
      })
      .catch(function (error) {
        console.log(error);
      }); 
      this.totalNews = this.news.length*1
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      if (this.currentPage>1) {
        var start = this.perPage*val-this.perPage
      }else{
        var start = 0
      }
      var self = this;
      function doSomething() {
        self.viewedNews = self.news.slice(start, self.perPage*self.currentPage);
      }
      setTimeout(doSomething, 500);
       TweenLite.to($('.newsBlock'),0.4,{height: $('.newsh').height()});
    },
    newsTween() {
      var duration = .4;
      var oddnews = $('.newsItem:odd').toArray();
      var evennews = $('.newsItem:even').toArray();
      var newsh = $('.newsh').height();
      console.log(newsh);
      TweenLite.to($('.newsBlock'),0.4,{height: $('.newsh').height()});
      TweenMax.staggerTo(oddnews, duration, 
        {scale:1, delay: 0.75, left: 0, opacity: 1, ease:Expo.easeOut },.25) 
      TweenMax.staggerTo(evennews, duration, 
        {scale:1, delay:  0.5, left: 0, opacity: 1, ease:Expo.easeOut},.25);
      function returnToNormal() {
         $('.newsBlock').attr('style', '');
      }
      setTimeout(returnToNormal, 1000);
    },


    newsOutTween(){
      var duration = .1;
      var oddnews = $('.newsItem:odd').toArray();
      var evennews = $('.newsItem:even').toArray();
      TweenMax.staggerTo(oddnews, duration, 
        {scale: 0.1, left: 200, opacity: 0, ease:Linear.easeInOut },.1) 
      TweenMax.staggerTo(evennews, duration, 
        {scale: 0.1, delay:  0.1, left: -200, opacity: 0, ease:Linear.easeInOut},.1);
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