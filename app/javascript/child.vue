<template>
  <div class="child"> 
  	<div>
      <h4>Детям и подросткам</h4>
      <div class="hrline scale-in-hor-right"></div>
  	</div>
 		<div v-for="(item, index) in data" class="bganim">
      <div class="bgstring" @click="clickhandler(item.id, $event) ">   
        {{item.name}}       
      </div>
 		</div>
    <div v-for="item in popemploy(data)">
      <el-dialog 
      class="fizer"
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
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      data:'',
      empid: '',
      dialogTableVisible: false,
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
          return item.cat == 2
        });
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
    anim() {
      var selectedWork = new TimelineMax() ;
      var menuitems = $('.bgstring').toArray();
      var m2 = (menuitems.length/2).toFixed();
      var m3 = menuitems.splice(m2);
      menuitems.reverse();
      console.log("123");
      selectedWork
        .staggerFromTo(menuitems, 0.2, {
        opacity: 0,
        scale: 0.1,
        left: "230px",
      },{
        opacity: 1,
        scale: 1,
        left: "0px",
        ease: Power4.easeOut
      },.30).staggerFromTo(m3, 0.2, {
        opacity: 0,
        scale: 0.2,
        left: "230px",
      },{
        opacity: 1,
        scale: 1,
        left: "0px",
        ease: Power4.easeOut
      },.30);
    }
  },
  created() {
     this.catchchild();
      
  },
  mounted() {
    var self = this;
    setTimeout(function(){
      self.anim();
       },500 );
    
  }
}
</script>
<style scoped>
@import "stylesheets/_variables";
 .fizer {
  lost-center: 1160px;
 }
.container {
  overflow: hidden;
}
.hrline {
  @extend %hrline;
  margin: 0.1em 0 0.2em -0.5em;
  background-color: $str1;
} 
.child {
  position: relative;
  overflow: hidden;
	display: flex;
  flex-direction: column;
  align-items: flex-end;
  h4 {
    color: $str4;
    margin: 0 0 0 0;
  }
}
.bgstring {
  
  left: 600px;
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