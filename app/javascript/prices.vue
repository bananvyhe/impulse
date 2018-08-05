<template>
  <div class="">
    <transition name="fade">
      <div class="cont1 " v-if="adult.length">
        
          <h4>{{teamssect[0].name }}</h4> 
          <el-table 
            stripe
            :data = "adult"
             
            style="width: 100%">
            <el-table-column  
            prop="name" 
            width="220px"
            label="Наименование услуги"></el-table-column>
            <el-table-column prop="graph" label="График занятий"></el-table-column>
            <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
            <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
          </el-table>
          <br>
         
      </div>
    </transition>
    
    <transition name="fade">
      <div v-if="child1.length">
        <!-- <h4>Для детей</h4> -->
        <h4>{{teamssect[1].name }}</h4> 
        <el-table stripe
          
          :data = "child1" style="width: 100%">
          <el-table-column  
          width="180"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
          <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>
  </div>
</template>

<script>
import axios from 'axios' 
let child1 = {value:  ''};
let adult = {value:  ''};
export default {
 
  data: function () {
    return {
    	teamssect: '',
 			teams: '',
 			child1: child1,
 			adult: adult,
      postBody: '',
      errors: [],
    }
  },
  computed: {

  },
  methods: {
     newsTween() {
       
      var tableanim = $('.tableanim').toArray();
      TweenMax.staggerTo( tableanim, 1,{ opacity: 1, ease:Expo.easeOut },.25);
    },
  	child2(){
      this.child1 = this.teams.filter(function(item) {
          return item.team_id == 3
        });
        this.adult = this.teams.filter(function(item) {
          return item.team_id == 1
      });
        
  	},
  	adult1() {
 
  	},
    axiosget1() {
      axios.get('/players ')
      .then((response) => {
        this.teams = response.data;
       
      })
      .catch(function (error) {
        console.log(error);
      });  
    },
    axiosget2() {
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
  	this.axiosget1();
    this.axiosget2(); 
    
    
  },
  mounted() {
    var self = this;
    setTimeout(function(){
      self.child2();
      self.newsTween();
    },500 );
      
     
  },
  updated(){
  },
  beforeUpdate() {
  }
} 
</script>

<style scoped>
@import "stylesheets/_variables";
.cont1 {  
  position: relative;
}
.tableanim{
  opacity: 0;
}
.wrap {@nowrap; 
  background-color: #dad;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
} 
</style>