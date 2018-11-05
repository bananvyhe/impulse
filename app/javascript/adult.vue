<template>
  <div class="adult  mediumtext">
  	<div class="pad"> 
  		<h4>Взрослым</h4>
      <div class="hrline scale-in-hor-left"></div>
  	</div>

 		<div v-if="data" v-for="(item, index) in data" class="bganim">
      <div class="bgstring2" @click="clickhandler(item.id, $event)">
 			  {{item.name}}
      </div>
       <div v-for="item in popemploy(data)"> 
      <el-dialog 
      class=""
      :title="item.name"
      :visible.sync="dialogTableVisible"
      :lock-scroll = 'true'
      :width = vw>
        <div class="container mediumtext">
          <span v-html="item.desc"></span>  
        </div>
      
    </el-dialog></div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      data:'',
      empid: '',
      dialogTableVisible: false,
      vw: '40%'
    }
  },
  methods: {
    popemploy: function(data) {
      if (this.empid != ''){
      var self = this;  
      return data.filter(function (elem) {
 
        return elem.id == self.empid;
        })
      }
    },
    clickhandler( event) {
      this.dialogTableVisible = true;
      this.empid = event;
       
    },
    catchchild() {
       axios.get('/programms')
      .then((data) => {
        this.data = data.data.filter(function(item) {
          return item.cat == 1
        });
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
    anim() {
      var selectedWork = new TimelineMax() ;
      var menuitems = $('.bgstring2').toArray();
      var m2a = (menuitems.length/2).toFixed();
      var m3a = menuitems.splice(m2a);
      menuitems.reverse();
      selectedWork
        .staggerFromTo(menuitems, 0.5, {
        opacity: 0,
        scale: 0.1,
        right: "230px",
      },{
        opacity: 1,
        scale: 1,
        right: "0px",
        ease: Power4.easeOut
      },.25).staggerFromTo(m3a, 1, {
        opacity: 0,
        scale: 0.2,
        right: "230px",
      },{
        opacity: 1,
        scale: 1,
        right: "0px",
        ease: Power4.easeOut
      },.5, "-=1");
    }
  },
  created() {
     this.catchchild();
  },
  watch: {
    data: function() {
      var self = this;
      setTimeout(function(){
        self.anim();
      },10 );
    }
  },
  mounted() { 
    if (document.body.clientWidth > 1200) {
      this.vw = '1000px'
    } else if(document.body.clientWidth < 580){
      this.vw = '95%'
    } else{
      this.vw = '80%'
    }  
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
.pad {
  padding-bottom: 0.3em;
  h4 {
    padding-bottom: 0.1em;
  }
}
 .fizer {
  lost-center: 1160px;
 }
.hrline {
  @extend %hrline;
  margin: 0.1em 0 0.3em -0.5em;
  background-color: $str1;
} 
.adult {
  /*padding-top: 0.5em;*/
  position: relative;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  @media (--only-small-screen) {
    align-items: flex-end;
  }
  h4 {
    color: $str4;
    margin: 0 0 0 0;
  }
}
.container {
  overflow: hidden;
}
.bgstring2 {
  right: 600px;
  cursor: pointer;
  display: inline-block;
  position: relative;
  @extend %bgstring;
  &:hover {
    transition: 0.2s cubic-bezier(0,.27,.07,1);
    color: #fff;
    background-color: $str4;
  }
}
.bganim {
     
}
</style>