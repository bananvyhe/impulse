<template>
  <div>
    
      <div>
        <div> 
          <h4>Подробные описания занятий:</h4>
          <div class="hrline scale-in-hor-left"></div>
        </div>
        <transition-group name="list">
          <div v-for="(item, index) in programms"  v-bind:key="index">
            <div @click="clickhandler(item.id, $event) ">   
               <el-button type="text" @click="dialogVisible = true">{{item.name}}</el-button>      
            </div>
          </div>
        </transition-group>
       
        <div v-for="item in popemploy(programms)">
          <el-dialog
           class="containerpop"
          :title="item.name" 
          :visible.sync="dialogTableVisible"
          :lock-scroll = 'false'
          width="90%">
            <div class="container">
               <span v-html="item.desc"></span>  
            </div>
          </el-dialog>
        </div>
      </div> 
      
    
  	<!-- <el-collapse v-model="activeName" accordion>
		  <el-collapse-item v-for="programm of programms" 
        :title="programm.name"  
        :name = "programm.id">
		    <div class="subj"><p>&laquo;{{programm.name}}&raquo;</p></div>
  		<div class="name"><span v-html="programm.desc"></span></div>
		  </el-collapse-item>
		</el-collapse> -->



  </div>
</template>
<script>
import axios from 'axios'
let pathname = document.location.pathname;
export default {
  data: function () {
    return {
      pathname: pathname,
      programms: [],
      activeName:  '',
      progid: '',
      dialogTableVisible: false,
    }
  },
  watch: {

  },
  methods: {
    clickhandler( event) {
      this.dialogTableVisible = true;
      this.progid = event;
       
    },
    popemploy: function(programms) {
      if (this.progid != ''){
      var self = this;
      return programms.filter(function (elem) {
 
        return elem.id == self.progid;
        })
      }
    },
    fetchNews: function() {
      axios.get('/programms')
      .then((response) => {
        this.programms = response.data
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
.hrline {
  width: 17em;
}
.container {
  overflow: hidden;
}
.containerpop{
  lost-center: $maincontent;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}  

.list-item {
  display: inline-block;
  margin-right: 10px;
}
.list-enter-active, .list-leave-active {
  transition: all 1s;
}
.list-enter, .list-leave-to /* .list-leave-active до версии 2.1.8 */ {
  opacity: 0;
  transform: translateY(30px);
}
</style>