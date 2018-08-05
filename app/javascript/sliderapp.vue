<template >
  <div class="sliderapp" 
    @mouseleave = "hoverslide = false"
    @mouseenter = "hoverslide = true">
    <el-carousel indicator-position="outside"
      v-bind:interval="interval" 
      @change="change" 
      v-bind="{height: visota.value + 'px', 
       }">
      <el-carousel-item  class="sliderText" v-for="(item, index) in sliders" :key='index'>
          <div class="mainFormat" :style="{backgroundImage: 'url(' + item.slide.thumb.url}">
            <div class ="infoBlock">
                <transition v-if = "item.caption1 != false" name='slide' appear>
                  <div 
                    :key='index' 
                    class="titlefirst" 
                    v-show="slideAnimRestart"
                    @click="slideAnimRestart = false"><h3><span v-html="item.caption1"></span></h3>
                  </div> 
                </transition>
                <transition v-if = "item.caption2 != false" name='fade' :duration="4000" appear> 
 
                    <div 
                      :key='item.id' 
                      class="titlesecond" 
                      v-show="slideAnimRestart2"
                      @click="slideAnimRestart2 = false"><span v-html="item.caption2"></span>
                    </div>                    
               

                </transition>
            </div>
            <br>
           </div>
      </el-carousel-item>
    </el-carousel>
    <div 
      v-show="switcher" class="switcher">
      hoverslide: {{hoverslide}}
      <br>addhide: {{addhide}}
      <br>slideAnimRestart: {{slideAnimRestart}} 
      <br>slideAnimRestart2: {{slideAnimRestart2}}
       <br>hideind: {{hideind}}
    </div> 
  </div>
</template>
<script>
  import axios from 'axios'
  let vis = {value: '30'};
  function resize() {
    if (window.matchMedia('only screen and (max-width: 600px)').matches) {
      console.log('under 600 pixels');
      vis.value = '300';
    } else if (window.matchMedia('only screen and (min-width: 601px) and ' + '(max-width: 1423px)').matches) {
      console.log('between 601 and 1024 pixels');
      vis.value = '250';                      
    } else {
      console.log('higher than 1024 pixels');
      vis.value = '300'; 
    }
  }
  window.addEventListener('load', resize );
  let divHeight = {value:  ''};
  export default {
    data: function () {
      return {
        slide: '/uploads/slider/slide/10/img6.jpg',
        sliders: [],
        firsttitledelay: 0.8,
        secondtitledelay: 0.65,
        divHeight: divHeight,
        hoverslide: false,
        interval: 7000,
        slideAnimRestart: '',
        slideAnimRestart2: '',
        animfade: 'fade',
        switcher: false,
        visota: vis,
        hider: ''
      }
    },
    created() {
      axios.get('/sliders')
      .then(response => {
        this.sliders = response.data
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
    mounted() { 
       window.addEventListener('resize', _.throttle(resize, 100));
    },
    computed: {
      //отключение индикации слайдов при маленьких разрешениях
      hideind: function() {
        if (this.visota.value <= 130){
          return this.hider = 'none';
        }else{
          return this.hider = '';
        }
      },
      //при ложном ховерслайд, запускать таймаут начала анимации фейд-аут
      addhide: function(){
        var vm = this;
        if (vm.hoverslide) {
          console.log('freeze animation');
        }else{
          console.log('begin timer fade-out');
          setTimeout(function(){
            if (vm.hoverslide == '0') {
              vm.slideAnimRestart = false;   
            }
          }, vm.interval * this.firsttitledelay);
          setTimeout(function(){
            if (vm.hoverslide == '0') {
              vm.slideAnimRestart2 = false;   
            }
          }, vm.interval * this.secondtitledelay);  
        }
      } 
    },
    //реакция, после смены слайда
    methods: {
      change: function(){
        var vm = this;
         //запуск таймаута анимации фейд-ин
        setTimeout(function(){
          vm.slideAnimRestart = true;          
        },this.interval * 0.1);
        setTimeout(function(){
          vm.slideAnimRestart2 = true;
        },this.interval * 0.1);
        
        console.log('slide listed and begin timeout fade-in animation');
        //при ложном ховерслайд, запускать таймаут начала анимации фейд-аут
        setTimeout(function(){
          if (vm.hoverslide == '0') {
            vm.slideAnimRestart = false;
          }
        }, vm.interval * this.firsttitledelay);
        setTimeout(function(){
          if (vm.hoverslide == '0') {
            vm.slideAnimRestart2 = false; 
          }
        }, vm.interval * this.secondtitledelay);
      }
    } 
  }

</script>

<style scoped>
@import "stylesheets/_variables";
.mainFormat {border-radius: 0.6em;
  display: flex; 
  width: 100%; 
  height: 100%;
  justify-content: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
.infoBlock {  
  padding-left: 7%;
  padding-right: 7%;
  display: flex;
  flex-direction: column;
   
  align-self: center;


}
.titlefirst {
  margin-bottom: 0.1em;
  /*@extend %roundbgstr;*/
  h3 {
     
    
    text-shadow: 5px 2px 12px rgba(0,0,0,0.9);

    margin: 0.2em 0.1em 0.2em 0;
    font-weight: bold;
    text-align: center;
    color: $isabelline;
   /* color: $palespringbud;*/

/*      text-shadow: 
      -0   -1px 0   #FFFFFF,
       0   -1px 0   #FFFFFF,
      -0    1px 0   #FFFFFF,
       0    1px 0   #FFFFFF,
      -1px -0   0   #FFFFFF,
       1px -0   0   #FFFFFF,
      -1px  0   0   #FFFFFF,
       1px  0   0   #FFFFFF,
      -1px -1px 0   #FFFFFF,
       1px -1px 0   #FFFFFF,
      -1px  1px 0   #FFFFFF,
       1px  1px 0   #FFFFFF,
      -1px -1px 0   #FFFFFF,
       1px -1px 0   #FFFFFF,
      -1px  1px 0   #FFFFFF,
       1px  1px 0   #FFFFFF;*/
    }
}
  .bgcap2 {

  }
.titlesecond {
  padding: 0.3em 0.6em 0.3em 0.8em;
  color: $isabelline;
  @extend %roundbgstr;

}
.sliderapp { overflow: hidden;
  
}
.sliderText {border-radius: 0.6em;
  display: flex;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}
.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}
  .switcher {
  padding-left: 10em;
}
.slide-enter-active {
 animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}
/* ----------------------------------------------
 * Generated by Animista on 2018-8-5 19:50:45
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation text-focus-in
 * ----------------------------------------
 */
@keyframes text-focus-in {
  0% {
    filter: blur(12px);
    opacity: 0;
  }
  100% {
    filter: blur(0px);
    opacity: 1;
  }
}
/*animation: slide-in-blurred-left 0.25s cubic-bezier(0.230, 1.000, 0.320, 1.000) both;
}
@keyframes slide-in-blurred-left {
  0% {
    transform: translateX(-1000px) scaleX(2.5) scaleY(0.2);
    transform-origin: 100% 50%;
    filter: blur(40px);
    opacity: 0;
  }
  100% {
    transform: translateX(0) scaleY(1) scaleX(1);
    transform-origin: 50% 50%;
    filter: blur(0);
    opacity: 1;
  }
}
  */
.slide-leave-active {
  animation: fade-out 1s ease-out both;
}
@keyframes fade-out {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
.fade-enter {
  opacity: 0;
}
.fade-enter-active {
  animation: fade 1.5s;
}
.fade-leave-active {
  transition: opacity 1.8s;
  opacity: 0;
}
@keyframes fade {
  0% {
    opacity: 0;
  }
  40% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.text-focus-in {
  animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}
/* ----------------------------------------------
 * Generated by Animista on 2018-8-5 19:50:45
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * animation text-focus-in
 * ----------------------------------------
 */
@keyframes text-focus-in {
  0% {
    filter: blur(12px);
    opacity: 0;
  }
  100% {
    filter: blur(0px);
    opacity: 1;
  }
}

</style>