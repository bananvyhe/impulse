<template>
  <div class="emp"> 
    <div class="popup ">
      <el-dialog 

      class="containerpop"
      :visible.sync="dialogTableVisible"
      :lock-scroll = 'false'
       :width = vw
      > 
      <div class ="basetext poup" v-for="item in popemploy(employee)">
        <div class="topSectAv bodytext">
          <div class="avatarSect1"  v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">
          </div>
          <div class="avatarSect2">
            <div class="fioSpec effect4">
              <h2>{{item.name}}</h2>
              <div style="padding-left: 0.5em; padding-top: 0.5em; padding-bottom: 0.5em;" v-html="item.prof"></div> 
              <div style="padding-left: 0.5em;" v-html="item.spec"></div>  
            </div>
          </div>
          <div class="bodyt">
          <span  v-html="item.desc"></span></div>
        </div>  
<!--         <div class="empDesc">
          <span v-html="item.desc"></span>
        </div> -->
      </div>
      </el-dialog>
    </div>
    <div class="heading">
      <h4>Сотрудники</h4>
      <!-- {{employees}} -->
      <div class="hrline scale-in-hor-center"></div>
    </div> 
    <div class="group" v-show = "vis == true">
      <draggable v-model="employees" v-if="type == '1'"  @end="employeeMoved"> 
        <div  class="avapreview" v-for="item in employee"  >
          <!--  <div class="cardpic" v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">  -->
          <div class="cardpic" v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">
            <div class="bgsh" 
            @click="clickhandler(item.id, $event) "> 
              <div class="bg"> 
                <div v-if="item.prof">
                  <div v-if="item.prof.length > croptextvalue" class="prof"  > {{item.prof.slice(0, croptextvalue) + ''}}<!-- <span v-html="item.desc"></span> --></div>
                  <div v-else class="prof"> <div class="profp">{{item.prof}}</div><!-- <span v-html="item.desc"></span> --></div>
                </div>
                
                <div class="itemTitle">
                  <h5>{{item.name}}</h5>
                </div>
                <div class="descM">
                  <div class="desc tinytext" v-html="item.prof"></div>
                </div>
              </div>
            </div> 
          </div>  
            <!-- <div class="topSectAv">
              <div class="avatarSect1"  v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">
              </div>
              <div class="avatarSect2">
                <div class="fioSpec  effect4"><h2>{{item.name}}</h2>
                  <span v-html="item.spec"></span>
                </div>
              </div>  
            </div>
            <div class="empDesc"><span v-html="item.desc"></span>
            </div>   -->
        </div>
      </draggable>
      <div v-else>
         <div  class="avapreview" v-for="item in employees"  >
          <div class="cardpic" v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">
            <div class="bgsh" 
            @click="clickhandler(item.id, $event) "> 
              <div class="bg"> 
                <div v-if="item.prof">
                  <div v-if="item.prof.length > croptextvalue" class="prof"  > {{item.prof.slice(0, croptextvalue) + ''}}<!-- <span v-html="item.desc"></span> --></div>
                  <div v-else class="prof"> <div class="profp">{{item.prof}}</div><!-- <span v-html="item.desc"></span> -->
                </div>
              </div>
                
              <div class="itemTitle">
                <h5>{{item.name}}</h5>
              </div>
                <div class="descM">
                  <div class="desc tinytext" v-html="item.prof"></div>
                </div>
              </div>
            </div> 
          </div>  
        </div>
      </div>      
    </div>
    <div class="cfx"></div>
  </div>
</template>
<script>
// let popWidth = {value: ''};

import axios from 'axios'
import draggable from "vuedraggable"

export default {
  components: { draggable },
  props: ["original_employees", "original_type"],
  data: function () {
    return {
      fullscreen: true,
      type: this.original_type,
      employees: this.original_employees, 
      // popWidth: popWidth,
      croptextvalue: 25,
      employee: '',
      vis: false,
      dialogTableVisible: false,
      dialogFormVisible: false,
      empid: '',
      vw: '40%'
    }
  },
  created() {
    this.getemps()
  },
  mounted() {
     if (document.body.clientWidth > 1200) {
      this.vw = '1000px'
    }else if(document.body.clientWidth < 500){
      this.vw = '96%'
    }else{
      this.vw = '80%'
    }
    // var self = this;
    // setTimeout(function(){
    //   self.vis = true;
    //   // self.cropText();
    //   self.cardTween();  

    // },300 );
  },
  watch: {
    employee: function() {
      var self = this;
      setTimeout(function(){
        self.vis = true;
        self.cardTween();
        console.log("345678")
      },10 );
    }
  },
  methods: {
    getemps: function(){
      axios.get('/employees')
      .then((response) => {
        this.employee = response.data;
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
    employeeMoved: function(event) {
      var data = new FormData
      console.log(data)
      data.append("employee[position]", event.newIndex + 1)
      axios({
        method: 'PATCH',
        url: `/employees/${this.employees[event.newIndex].id}/move`,
        // type: "PATCH",
        data: data,
        // dataType: "json",
        // success: this.getemps()
      }).then((response) => { 

        this.input = ''
        this.getemps()
        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      }) 

 
    },        
    // cropText() {
    //   var size = 10,
    //   newsContent= $('.prof'),
    //   newsText = newsContent.text();
        
    //   if(newsText.length > size){
    //     newsContent.text(newsText.slice(0, size) + ' ...');
    //   }
    // },
    popemploy: function(employee) {
      if (this.empid != ''){
      var self = this;  
      return employee.filter(function (elem) {
         return elem.id == self.empid;
        })
      }
    },
    clickhandler( event) {
      this.dialogTableVisible = true;
      this.empid = event;
       
    },
    select() {
      console.log('321')
    },
    cardTween(){
      var selectedWork = new TimelineMax() ;
      selectedWork
        .staggerFromTo('.cardpic', 0.9, {
          autoAlpha:0,
          // yPercent: 50,
           scale: 1.1,
        }, {
           scale: 1,
          autoAlpha:1,
          // yPercent: 0,
          ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0.1, "+=0.35")
        .staggerFromTo('.itemTitle', 0.5, {
          y: -30,
          autoAlpha:0
        }, {
          y: 0,
          autoAlpha:1,
          ease:Expo.easeOut,
        }, 0.1, "-=0.6")
        .staggerFromTo('.prof', 1, {
          autoAlpha:0,
          yPercent: 0,
        }, {
          autoAlpha:1,
          yPercent: 0,
          ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0.1, "-=1.5")
        .staggerFromTo('.bg', 0.4, {
           yPercent: 100, 
         // scale:1,
        }, {
          // scale: 0.9,
          yPercent: 90, 
          // xPercent: 5, 
          // scale:0.9,
          ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0.1, "-=1.0")
        .staggerTo('.itemTitle', 0.1, {
          autoAlpha:1,
          // borderBottomRightRadius: 0,
          onComplete: endAnima
        },0.2, "-=0.6");

        TweenMax.set('.desc', {
          display: 'none',
          // xPercent: -100
          opacity: 0 
        });
       
       
      var self = this;
      function endAnima() {
        $('.avapreview').each(function(index, element){
          var thisHeight = $(element).find(".desc").outerHeight();
          var projectHover = new TimelineMax({paused:true});
          projectHover
            .to(($(this).find('.cardpic')), 0.5, {
              // borderRadius: '1em',
               scale:1.05,
              ease: Circ.easeOut,
              boxShadow: "0px 1px 35px 0px rgba(0, 0, 0, 0.4)",
            }, 0)
            .to(($(this).find('.desc')), 0.5, {

              opacity: 1,
              display: 'block',
              xPercent: 0,
              height: thisHeight,
              ease: Circ.easeOut
            }, 0.1)
            .to(($(this).find('.itemTitle')), 0.5, {
              marginBottom: '0px',
              borderRadius: 0,
              backgroundColor: 'rgba(0, 0, 0, 0.4)',
              // color: '#000',
              // className: '+=tada'
            }, 0)
            .to(($(this).find('.itemTitle h5')), 0.5, {
               
              color: '#F4F3EE',
              // className: '+=tada'
            }, 0)
            .to(($(this).find('.bgsh')), 0.3, {
              boxShadow: 'inset 0px 0px 80px 30px rgba(0,0,0,0.4)',
            }, 0)
            .to(($(this).find('.profp')), 0.2, {
              // opacity: 0, 
              yPercent: 100,
              ease: Power0.easeOut, 
            }, 0)
            .to(($(this).find('.prof')), 0.5, {
              transformOrigin: '100% 100%',
              scaleY: 0,
              borderRadius: 0, 
              ease: Expo.easeInOut, 
            }, 0)
            .to(($(this).find('.bg')), 0.5, {
              xPercent: 0,  
              scale: 1,
              yPercent: 25, 
            }, 0)
            element.animation = projectHover;
          });
        $('.avapreview').hover(over, out);
        function over(){ this.animation.play() };
        function out(){ 
          // console.log(self.dialogTableVisible)
          if (self.dialogTableVisible == false) {
            // console.log('true1');
            this.animation.reverse() 
          }
        }; 
        $('.avapreview').click(function() {
          this.animation.pause();
        });
      }
    },
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
.emp {
  padding-bottom: 3em;
}
.el-dialog__wrapper {
  
} 
.bodyt {

}
.bodytext {  

  padding: 0.5em;
/*  ul, ol {

    padding-left: 5.5em;
    
  }*/
}
.containerpop { 
  /*overflow:  hidden;*/

 

}
.hrline { 
  width: 10em; 
  @extend %hrline;
  margin: 0.1em 0 0.2em -0.5em;
  background-color: $str1;
} 
.popup {

}
.poup {
   
 
}
.heading { 
  display: flex;
  flex-direction: column;
  align-items: center; 
  padding-bottom: 0.5em;
  @media (--only-small-screen) {
    padding-bottom: 0.6em;
  }
}
.group {
  padding-top: 1em;
  @media (--only-xsmall-screen) {
    lost-center: 280px;
  }
  @media (--only-small-screen) {
    lost-center: 500px;
  }
  @media (--only-medium-screen) {
    lost-center: 900px;
  }
  @media (--only-1600more-screen) {
    lost-center: 1170px;
  }
}

.bgsh { 
  /*overflow: hidden;*/
    box-shadow: inset 0px 0px 30px 5px rgba(0,0,0,0.1);
 /* border-radius: $borderRad; */
  cursor: pointer; 
  display: flex;
  align-items: flex-end;
  width: 100%; 
 
}
.avapreview { 
  display: flex;
  
  @media (--only-xsmall-screen) {
    lost-waffle: 1/1 1 3em ;
    height:  21em;
    padding-bottom: 0.5em;
  }
  @media (--only-small-screen) {
    padding-bottom: 2em;
    lost-waffle: 1/2 2 2em ;
    height:  17.0em;
  }
  @media (--only-medium-screen) {
    padding-bottom: 5em;
    lost-column: 1/4 4 2em;
    height: 17.5em;
  }
  @media (--only-1600more-screen) {
    padding-bottom: 5em;
    lost-column: 1/5 5 2em;
    height: 18.0em;
  }
}
.cardpic {
   
 /* border: 1px solid  $x11gray;*/
  width: 100%;
 /* overflow: hidden;*/
  display: flex;
  position: relative;

  /*border-radius: $borderRad; */
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;  
}
.bg {
  position: relative;
  width: 100%;
}
.shad {
   box-shadow: inset 0px 0px 50px 20px rgba(0,0,0,0.4);
}
.prof { position: relative;
  z-index: 20;
  border-top-left-radius: 0em;
  border-top-right-radius: 0em;
  display: flex;
  justify-content: center;
  align-items: center;
  padding:0.3em 1em 0.3em 0.5em; 
  background-color: #748CAB;
  /*border-top-right-radius: 0.5em;*/
  /*border-top-left-radius: 2em; */
  adjust-font-size: fs t;
  line-height: 1.2;
  color: $antiflashwhite;
}
.itemTitle {
  position: relative;
  z-index: 2;
 /* border-bottom-right-radius: 2em; */
  border-left: 1px solid  $x11gray;
  border-right: 1px solid  $x11gray;
  border-bottom: 1px solid  $x11gray;
  background: rgba(255, 255, 255, 1);
  text-align: right;
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1em;
  padding: 0 0.8em 0.1em 1em;
  border-bottom-left-radius: 0.2em;
  border-bottom-right-radius: 0.2em;

  h5 {
    margin-top: spacing(0.1);

  }


}
.descM { 
  background-color: rgba(255, 255, 255, 1); 
  overflow: hidden;
  width: 100%;
 

}
.desc {
 line-height: 1.2em;
     text-indent: 0;

 
  padding: 0 1em 0.5em 0.5em;
  margin:0.5em;
  width: 100%;

  /*&:not(:hover) {
    transition: 1s cubic-bezier(0.23, 1, 0.32, 1);
  }
  h5 {
    text-align: right;
  }
  .desc {
      opacity: 0;
  }*/
}

@keyframes descslide {
  0% {
    transform: scaleY(1);
    transform-origin: 0% 100%;
    opacity: 1;
  }
  100% {
    transform: scaleY(2);
    transform-origin: 0% 100%;
    opacity: 1;
  }
}

.cfx {
  clear: both;
}
.topSectAv {
  @media (--only-small-screen) {
    margin-top: 0em;
  }
  @media (--only-medium-screen) {
   /* height:  24vw;*/
  }
  @media (--only-1600more-screen) {
    /*height:  20vw;*/
  }
  .avatarSect1 {
      
    float: left;
    position: relative;
    z-index: 18;
    background-color: #fff;
    box-shadow: 0px 2px 10px 0px #5c5c5c;
    border: 0.3em solid $isabelline;
    border-radius: 0em;
    margin: 0em 1.8em 1em 1em;
    background-position: center;
    background-size: cover; 
    background-repeat: no-repeat;
    width: 17em;
    height: 20em;
    .fotoEdit {
      font-size: fs t;
      margin: 0.5em;
      padding: 0.1em;
      background-color: rgba(255, 255, 255, 0.5);
    }
     @media (--only-xsmall-screen) {
      display:none;
    }
    @media (--only-small-screen) {
      display:none;
    }
    @media (--only-medium-screen) {
      /* lost-column: 1/4 0 ; */
    }
    @media (--only-1600more-screen) {
      /*lost-column: 1/5 2 0 ; */
    }
  }
  .avatarSect2 {z-index: 10;
    /*display: flex;
    flex-direction: column;*/
    position: relative;
    padding: 1em;
    margin-bottom: 0.5em;
    margin-top: 1.5em;
    .fioSpec { position: relative;  
      color: #333;
      margin-left: 0em;
      background-color: $color-blue;
      border-bottom-right-radius: 0.2em;
      border-top-right-radius: 0.2em;
      /*border-radius: 0.2em;*/
      padding: 0.5em 1em 1em 3em;
      @media (--only-small-screen) {
        margin-left: -1em;
        padding: 0.5em 1em 1em 1em;
      }
   
      @media (--only-xsmall-screen) {
        margin-left: -2em;
        margin-right: -2em;
         padding: 0.5em 1em 1em 1em;
      }

      h2 {
        background-color: #fff;
        padding: 0.2em  ;
        margin: 0.2em 0em 0.2em 0em;
        text-indent: 0.2em;
        @media (--only-small-screen) {
          margin-left: 0em;
        }
        @media (--only-xsmall-screen) {
          font-size: 1.2em;
          padding: 0.2em 0.5em 0.2em 0.5em;
        }
      }
    }

    @media (--only-small-screen) {
      padding: 1em;
      h2 {
        
        margin-bottom: spacing(0.1);
      }  
      /*lost-column: 1/1 1 0;  */
      margin-bottom: 0em;
      margin-top: 0em;
    }
    @media (--only-medium-screen) {
      /*lost-column: 3/4 2 0; */
    }
    @media (--only-1600more-screen) {
      /*lost-column: 4/5 2 0;*/
    }
  }
}
.empDesc {
  padding-left: 1em;
  margin-bottom: 1em;
  ul, ol {
    padding: 0em;
    margin-top: 0.2em;
  }
  @media (--only-small-screen) {
 
  }
}
 
.effect4{
  position: relative;
}
.effect4:before{
  $dist: -0.7em;

  @media (--only-medium-screen) {
    border-top-left-radius: 0.3em;
    position: absolute;
    content: '';
    top: 0px;
    height: 100%;
    width: 1.5em;
     
    z-index: 3;
    left: $dist;
     background-color: $color-blue;
    transform: skew(5deg);
    transform-origin: top left;
 
  }
  @media (--only-1600more-screen) {
    border-top-left-radius: 0.3em;
    position: absolute;
    content: '';
    top: 0px;
    height: 100%;
    width: 1.5em;
     
    z-index: 3;
    left: $dist;
     background-color: $color-blue;
    transform: skew(6deg);
    transform-origin: top left;
  }

}
.effect4:after{
  z-index: -1;
  position: absolute;
  content: "";
  bottom: 15px;
  right: 7px;
  left: auto;
  width: 50%;
  top: 80%;
  max-width:300px;
  background: #777;
  -webkit-box-shadow: 0 15px 10px #777;
  -moz-box-shadow: 0 15px 10px #777;
  box-shadow: 0 15px 10px #777;
  -webkit-transform: rotate(2deg);
  -moz-transform: rotate(2deg);
  -o-transform: rotate(2deg);
  -ms-transform: rotate(2deg);
  transform: rotate(2deg);
}
</style>
<style>
   .el-dialog__body {
    padding: 0px 30px 0px 30px;


  }
</style>