<template>
  <div>
    <h4>Для взрослых</h4>
    <!-- <div class="hrline scale-in-hor-left"></div> -->
  	<!-- <h4>{{teamssect[0].name }}</h4> -->
	  <el-table  stripe v-if="adult.length"
    :data = "adult"  style="width: 100%" 
    >
      <el-table-column sortable
      prop="name" 
      label="Наименование услуги"></el-table-column>
      <el-table-column  prop="graph" label="График занятий"></el-table-column>
      <el-table-column  prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
      <el-table-column 

       prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
  	</el-table>
    <h4>Для детей</h4>
    <!-- <div class="hrline scale-in-hor-left"></div> -->
		<!-- <h4>{{teamssect[1].name }}</h4> -->
  	<el-table stripe v-if="child.length"
    :data = "child"  style="width: 100%">
      <el-table-column sortable
      prop="name" 
      label="Наименование услуги"></el-table-column>
      <el-table-column  prop="graph" label="График занятий"></el-table-column>
      <el-table-column  prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
      <el-table-column 

       prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
  	</el-table>
     
  </div>
</template>

<script>
import axios from 'axios' 
 
export default {
 
  data: function () {
    return {
    	teamssect: '',
 			teams: '',
 			child: '',
 			adult: '',
      postBody: '',
      errors: [],
    }
  },
  computed: {

  },
  methods: {
  	child1(){

  	},
  	adult1() {
 
  	},
    axiosget() {
			axios.get('/players ')
    	.then((response) => {
        this.teams = response.data;
        this.adult = this.teams.filter(function(item) {
          return item.team_id == 1
      });
        this.child = this.teams.filter(function(item) {
          return item.team_id == 2
        });
	    })
	    .catch(function (error) {
	      console.log(error);
	    });  

	    axios.get('/teams ')
    	.then((response) => {
      this.teamssect = response.data ;

	    })
	    .catch(function (error) {
	      console.log(error);
	    });  
    }
  },
  created() {
  	this.axiosget();
     
 
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
.news {
  overflow: hidden;
}
.newsHead {
  display: flex;
  flex-direction: column;
  align-items: center; 
  padding: 1em 0 0em 0;
  h4 {
    color: $str6;
    margin: 0 0 0.1em 0;
  }
}
.hrline {  
  @extend %hrline;
  margin: 0.1em 0 0.3em -0.3em;
  background-color: $str6;
} 
.newsh {  
  lost-column: 1/1;
} 
.last{

}
.pag {
  width: 100%;
  display: flex;
  justify-content: center;
}
.newsBlock {
  lost-center: 1150px;
} 
.newsItem:nth-child(odd) {
  text-align: right;
    img {
      margin: 0.5em 0 0.5em 1em;
      float: right;
  }
  left: -40%;
  transform: scale(0,0);
}
.newsItem:nth-child(even) {
  right: -40%;
  transform: scale(0,0);
}
.newsItem { 
         background: radial-gradient(circle at 50% 100%, rgba(0,0,0, 0.05), rgba(0,0,0,0) 80%);
 /* border: 1px dotted $color-1;*/
  border-radius: 0.6em; 
  padding: 0.8em;
  position: relative;
  opacity: 0;
 
  lost-column: 1/2 2 0.5em;
  margin-bottom: 1em; 
  @media (--only-small-screen) {
    lost-column: 1/1 0 0;
  }
  img {
    border-radius: 0.2em;
    margin: 0.5em 1em 0 0;
    float: left;
  }
}
.newsdesc {
   text-shadow: 0 1px 1px rgba(255,255,255,0.25);
}
.bgi {
  background-color: #dad;
}
.bgimage {
  height: 200px;
/* color: #777;
         height: 200px;
        , 100% 1px, auto;
        background-position: 50% 100%, 50% 100%, 50% 0;
        background-repeat: no-repeat, no-repeat, no-repeat;
        background-origin: padding-box, border-box, padding-box;
        border-bottom: 1px solid transparent;
        padding: 20px;
        margin: 0 50px;
         
        text-shadow: 0 1px 1px rgba(255,255,255,0.25);
        text-align: center;*/

        background: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.1) 50%, rgba(0,0,0,0)),
        linear-gradient(to right, rgba(255,255,255,0), rgba(255,255,255,0.8) 50%, rgba(255,255,255,0)),
        radial-gradient(circle at 50% 100%, rgba(0,0,0, 0.05), rgba(0,0,0,0) 50%);
            /*linear-gradient(0deg, rgba(0,0,0,0), rgba(0,0,0,0.1) 50%, rgba(0,0,0,0)), 
            linear-gradient(0deg, rgba(255,255,255,0), rgba(255,255,255,0.8) 50%, rgba(255,255,255,0)), 
            radial-gradient(50% 100%, ellipse cover, rgba(0,0,0, 0.05), rgba(0,0,0,0) 50%);
    */
}
.child {
	display: flex;
  flex-direction: column;
  align-items: flex-end;
}
.bgstring {
  @mixin bgstring;
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