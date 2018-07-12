<template>
  <div class="adult">
  	<div> 
  		<h4>Взрослым</h4>
      <div class="hrline scale-in-hor-left"></div>
  	</div>
 		<div v-for="(item, index) in data" class="bganim">
      <div class="bgstring2" @click="clickhandler(item.id, $event)">
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
          return item.cat == 1
        });
      })
      .catch(function (error) {
        console.log(error);
      }); 
    }
  },
  created() {
     this.catchchild();
  },
  updated() {
    var menuitems = $('.bgstring2').toArray();
    var m2a = (menuitems.length/2).toFixed();
    var m3a = menuitems.splice(m2a);
    menuitems.reverse();
    TweenMax.staggerFrom(menuitems, 0.2, {
      opacity: 0,
      delay: 0.35,
      scale: 0.1,
      right: "230px",
      ease: Power4.easeOut
    },.30);
    TweenMax.staggerFrom(m3a, 0.2, {
      opacity: 0,
      delay: 0.50,
      scale: 0.2,
      right: "230px",
      ease: Power4.easeOut
    },.30);
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
 .fizer {
  lost-center: 1160px;
 }
.hrline {
  @extend %hrline;
  margin: 0.1em 0 0.2em -0.5em;
  background-color: $str1;
} 
.adult {
  overflow: hidden;
  display: flex;
  flex-direction: column;
   align-items: flex-start;
  h4 {
    color: $str4;
    margin: 0 0 0 0;
  }
}
.bgstring2 {
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