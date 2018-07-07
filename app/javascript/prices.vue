<template>
  <div>
   <!--  <div  v-if="adult.length">
     <!--  <h4>Для взрослых</h4> -->
    <!-- <div class="hrline scale-in-hor-left"></div> -->
     <h4>{{teamssect[0].name }}</h4> 
      <el-table stripe
        :data = "adult" style="width: 100%">
        <el-table-column sortable
        prop="name" 
        label="Наименование услуги"></el-table-column>
        <el-table-column prop="graph" label="График занятий"></el-table-column>
        <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
        <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
      </el-table>
    </div> -->
    {{child}}
    <div  v-if="child.length">
      <!-- <h4>Для детей</h4> -->
      <h4>{{teamssect[1].name }}</h4> 
      <el-table stripe
      :data = "child" style="width: 100%">
        <el-table-column sortable
        prop="name" 
        label="Наименование услуги"></el-table-column>
        <el-table-column prop="graph   " label="График занятий"></el-table-column>
        <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
        <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import axios from 'axios' 
let child = {value:  ''};
let adult = {value:  ''};
export default {
 
  data: function () {
    return {
    	teamssect: '',
 			teams: '',
 			child: child,
 			// adult: adult,
      postBody: '',
      errors: [],
    }
  },
  computed: {

  },
  methods: {
  	child1(){
      this.child = this.teams.filter(function(item) {
          return item.team_id == 2
        });
      //   this.adult = this.teams.filter(function(item) {
      //     return item.team_id == 1
      // });
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
 
    setTimeout (this.child1, 400);
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