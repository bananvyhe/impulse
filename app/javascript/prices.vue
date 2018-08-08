<template>
  <div class="tinytext"> 
    <transition name="fade"v-if="teamssect[0]  ">
      <div class="cont1"  v-if="adult.length">
        <div class="opad">
          <div class="pad">
            <h4>{{teamssect[0].name }}</h4> 
            <div class="hrline scale-in-hor-left basetext"  ></div>
          </div>
        </div>
          <el-table 
            
            stripe
            :data = "adult"
             
            style="width: 100%">
            <el-table-column  
            prop="name" 
            min-width="120px"
            
            label="Наименование услуги"></el-table-column>
            <el-table-column prop="graph" label="График занятий"></el-table-column>
            <!-- <el-table-column v-if="teams" prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
            <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
          </el-table>
          <br>
         
      </div>
    </transition>
    
    <transition name="fade" v-if="teamssect[1]  ">
      <div v-if="child1.length">
        <!-- <h4>Для детей</h4> -->
         <div class="opad">
          <div class="pad">
          <h4>{{teamssect[1].name}}</h4>
          <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          
          :data = "child1" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
          <!-- <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>

    <transition name="fade" v-if="teamssect[2]  ">
      <div v-if="sect3.length">
        <div class="opad">
          <div class="pad">
        <h4>{{teamssect[2].name }}</h4> 
        <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          :data = "sect3" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
          <!-- <el-table-column v-if="teams.group != false" prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>
    <transition name="fade" v-if="teamssect[3]    ">
      <div v-if="sect4.length">
        <div class="opad">
          <div class="pad">
        <h4>{{teamssect[3].name }}</h4> 
        <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          :data = "sect4" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
         <!--  <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>
    <transition name="fade" v-if="teamssect[4]">
      <div v-if="sect5.length">
        <div class="opad">
        <div class="pad">
        <h4>{{teamssect[4].name }}</h4> 
        <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          :data = "sect5" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
        <!--   <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>
    <transition name="fade" v-if="teamssect[5]">
      <div v-if="sect6.length">
        <div class="opad">
        <div class="pad">
        <h4>{{teamssect[5].name }}</h4> 
        <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          :data = "sect6" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
          <<!-- el-table-column v-if="" prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
          <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
        </el-table>
         <br>
      </div>
    </transition>
    <transition name="fade" v-if="teamssect[6]">
      <div v-if="sect7.length">
        <div class="opad">
        <div class="pad">
        <h4>{{teamssect[6].name }}</h4> 
        <div class="hrline scale-in-hor-left basetext" ></div>
        </div></div>
        <el-table stripe
          :data = "sect7" style="width: 100%">
          <el-table-column  
          min-width="220"
          prop="name" 
          label="Наименование услуги"></el-table-column>
          <el-table-column prop="graph" label="График занятий"></el-table-column>
          <!-- <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column> -->
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
let sect3 = {value:  ''};
let sect4 = {value:  ''};
let sect5 = {value:  ''};
let sect6 = {value:  ''};
let sect7 = {value:  ''};

export default {
 
  data: function () {
    return {
    	teamssect: '',
 			teams: '',
      sect3: sect3,
      sect4: sect4,
      sect5: sect5,
      sect6: sect6,
      sect7: sect7,
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
      this.sect3 = this.teams.filter(function(item) {
          return item.team_id == 4
      });  
      this.sect4 = this.teams.filter(function(item) {
          return item.team_id == 5
      });  
      this.sect5 = this.teams.filter(function(item) {
          return item.team_id == 6
      });  
      this.sect6 = this.teams.filter(function(item) {
          return item.team_id == 7
      }); 
      this.sect7 = this.teams.filter(function(item) {
          return item.team_id == 8
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

.opad {
   display: flex;
   align-items: flex-start;
   flex-direction: column;
}
.pad { 
  
}
.hrline {
  margin: 0.1em  0.1em 0em -0.2em;
}
.tablestyle {

}
.cont1 {  
  position: relative;
}
.tableanim{
  opacity: 0;
}
.wrap { 
  background-color: #dad;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
} 
</style>