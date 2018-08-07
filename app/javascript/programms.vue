<template>
  <div>
    
       
        <div> 
          <h4>Подробные описания занятий:</h4>
          <div class="hrline scale-in-hor-left"></div>
        </div>
     <!--    <transition-group name="fade" > -->
          <div v-for="(item, index) in programms"  v-bind:key="item.id">
            <el-collapse v-model="activeName" accordion>
            <el-collapse-item :title="item.name" class="cardpic" @click="clickhandler(item.id, $event) ">   
               <el-button type="text" @click="dialogVisible = true">{{item.name}}</el-button>      
            </el-collapse-item>
            </el-collapse>
          </div>
  <!--       </transition-group> -->
        <el-collapse v-model="activeName" accordion>
          <el-collapse-item title="Consistency" name="1">
            <div>Consistent with real life: in line with the process and logic of real life, and comply with languages and habits that the users are used to;</div>
            <div>Consistent within interface: all elements should be consistent, such as: design style, icons and texts, position of elements, etc.</div>
          </el-collapse-item>
          <el-collapse-item title="Feedback" name="2">
            <div>Operation feedback: enable the users to clearly perceive their operations by style updates and interactive effects;</div>
            <div>Visual feedback: reflect current state by updating or rearranging elements of the page.</div>
          </el-collapse-item>
          <el-collapse-item title="Efficiency" name="3">
            <div>Simplify the process: keep operating process simple and intuitive;</div>
            <div>Definite and clear: enunciate your intentions clearly so that the users can quickly understand and make decisions;</div>
            <div>Easy to identify: the interface should be straightforward, which helps the users to identify and frees them from memorizing and recalling.</div>
          </el-collapse-item>
          <el-collapse-item title="Controllability" name="4">
            <div>Decision making: giving advices about operations is acceptable, but do not make decisions for the users;</div>
            <div>Controlled consequences: users should be granted the freedom to operate, including canceling, aborting or terminating current operation.</div>
          </el-collapse-item>
        </el-collapse>
       <!--  <div  v-for="item in popemploy(programms)">
          <el-dialog
           class="containerpop"
          :title="item.name" 
          :visible.sync="dialogTableVisible"
          :lock-scroll = 'false'
          width="90%">
            <div class="container basetext">
               <span v-html="item.desc"></span>  
            </div>
          </el-dialog>
        </div>
          -->
       
      
    
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
    cardTween(){
      var selectedWork = new TimelineMax() ;
      selectedWork
        .staggerFromTo('.cardpic', 0.2, {
           
          autoAlpha:0,
          yPercent: 50,
        }, {
          autoAlpha:1,
          yPercent: 0,
          ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0.1, "+=0.35")
        .staggerFromTo('.itemTitle', 0.1, {
          y: -30,
          autoAlpha:0
        }, {
          y: 0,
          autoAlpha:1,
          ease:Back.easeOut.config(4),
        }, 0.1, "-=0.2")
        .staggerFromTo('.prof', 0.1, {
          autoAlpha:0,
          yPercent: 50,
        }, {
          autoAlpha:1,
          yPercent: 0,
          ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0.1, "-=0.4")
        .staggerTo('.itemTitle', 0.1, {
          autoAlpha:1,
          onComplete: endAnima
        });lcenter
    },
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
.mainframe {
  padding-left: 30%;
  padding-right: 30%;
}
.hrline {
  width: 17em;
  height: 0.1em;
}
.container {
  padding-left: 5%;
  padding-right: 5%;
  overflow: hidden;
  @media (--only-small-screen) {
    padding-left: 3%;
    padding-right: 3%;
  }
  @media (--only-xsmall-screen) {
    padding-left: 0%;
    padding-right: 0%;
  }
}
.containerpop{
  lost-center: $lcenter;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 1s;
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