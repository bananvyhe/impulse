<template>
  <div class="news">
 	  <div class="newsHead">
			<h4>Наши новости:</h4>
     	<div class="hrline scale-in-hor-center"></div>
		</div>
		<div class="newsBlock Y" id="Y">
      <div class="newsh">
        <div v-for="(item, index) in viewedNews" class="newsItem" v-bind:key="item.created_at" tag="div">
          <img :src="item.newspic.thumb.url"> 
          
          <span>{{item.created_at.substr(0,10).split("-").reverse().join(".")}}</span>
          <span v-html="item.desc"></span>  
        </div>      
      </div>
		</div>
    <div class="pag">
      <el-pagination 
        @current-change="handleCurrentChange"
        :page-size="perPage" 
        :current-page="currentPage"
        layout="prev, pager, next"
        :total="totalNews">
      </el-pagination>
    </div>
    <el-button type="success" plain onclick="location.href = '/news/'">Редактор новостей</el-button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      news: [],
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
      axios.get('/news')
      .then((data) => {
        this.news = data.data
        this.totalNews = this.news.length*1
        if (this.currentPage>1) {
          var start = this.perPage*this.currentPage-this.perPage
        }else{
          var start = 0
        }
        this.viewedNews = this.news.slice(start, this.perPage)
        this.newsTween();
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
      var duration = .2;
      var oddnews = $('.newsItem:odd').toArray();
      var evennews = $('.newsItem:even').toArray();
      var newsh = $('.newsh').height();
      console.log(newsh);
      TweenLite.to($('.newsBlock'),0.4,{height: $('.newsh').height()});
      TweenMax.staggerTo(oddnews, duration, 
        {scale:1, delay: 0.75, left: 0, opacity: 1, ease:Linear.easeInOut },.25) 
      TweenMax.staggerTo(evennews, duration, 
        {scale:1, delay:  0.5, left: 0, opacity: 1, ease:Linear.easeInOut},.25);
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
.newsHead {
  display: flex;
  flex-direction: column;
  align-items: center; 
  padding: 1em 0 1em 0;
  h4 {
    color: $str6;
    margin: 0 0 0em 0;
  }
}
.hrline { width: 12em; 
  @mixin hrline;
  margin: 0.1em 0 0.3em -0.3em;
  background-color: $str6;
} 
.newsh {
  lost-column: 1/1;
} 
.last{

}
.pag {
  display: flex;
  justify-content: center;
}
.newsBlock {
  lost-center: 1150px;
} 
.newsItem:nth-child(odd) {
  left: -20%;
  transform: scale(0,0);
}
.newsItem:nth-child(even) {
  right: -20%;
  transform: scale(0,0);
}
.newsItem {
  display: block;
  position: relative;
  opacity: 0;
  lost-column: 1/2;
  margin-bottom: 1em; 
  @media (--only-small-screen) {
    lost-column: 1/1 0 0;
  }
  img {
    border-radius: 0.2em;
    margin: 0 1em 0 0;
    float: left;
  }
}
.child {
	display: flex;
  flex-direction: column;
  align-items: flex-end;
}
.bgstring {
  @mixin bgstring;
}

.scale-in-hor-center {
	animation: scale-in-hor-center 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}
@keyframes scale-in-hor-center {
  0% {
    transform: scaleX(0);
    opacity: 1;
  }
  100% {
    transform: scaleX(1);
    opacity: 1;
  }
}
.fade-enter-active, .fade-leave-active { 
  transition: opacity 5.5s;
}

.fade-enter-active { 
  transition-delay: .8s;
}
 
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
   
} 
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for <2.1.8 */ {
  transform: translateX(500px);
  opacity: 0;
}
 
</style>