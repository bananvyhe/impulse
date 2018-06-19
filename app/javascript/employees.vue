<template>
  <div class="emp">
    <div class="heading">
      <h3>Сотрудники</h3>
    </div> 
    <div class="group">
      <div  class="avapreview" v-for="item of employee">
        <div class="cardpic" v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}"> 
           
          <div class="bg">
            <div class="itemTitle">
              <h4>{{item.name}}</h4>
            </div>
            <div class="descM">
            <div class="desc smalltext" v-html="item.spec"></div>
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
    </div>
    <div class="cfx"></div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      employee: ''
    }
  },
  created() {
    axios.get('/employees')
    .then((response) => {
      this.employee = response.data;
    })
    .catch(function (error) {
      console.log(error);
    }); 
  },
  updated() {
    this.cardTween();
     
  },
  methods: {
    cardTween(){
      var selectedWork = new TimelineMax() ;
      selectedWork
        .staggerFromTo('.cardpic', 0.1, {
          autoAlpha:0,
          scale: 0,
          rotationX: 30,
        }, {
          autoAlpha:1,
          scale: 1, 
          rotationX: 0,
          ease:CustomEase.create("custom", "0.250, 0.460, 0.450, 0.940")}, 0.2)
        .staggerFromTo('.itemTitle', 0.1, {
          y: -30,
          autoAlpha:0
        }, {
          y: 0,
          autoAlpha:1,
          ease:Back.easeOut.config(4),
        }, 0.1, "-=0.2")
        .staggerTo('.itemTitle', 0.1, {
          autoAlpha:1,
          onComplete: endAnima
        });

        TweenMax.set('.desc', {
          display: 'none'
        });

      function endAnima() {

        $('.avapreview').each(function(index, element){
          var thisHeight = $(element).find(".desc").outerHeight();
          var projectHover = new TimelineMax({paused:true});
          projectHover
            .to(($(this).find('.cardpic')), 0.3, {
              scale:1.05,
              ease: CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000"),
              boxShadow: "0px 1px 35px 0px rgba(0, 0, 0, 0.3)",
            }, 0)
            .to(($(this).find('.desc')), 0.5, {
              display: 'block',
              height: thisHeight,
              ease:CustomEase.create("custom", "0.390, 0.575, 0.565, 1.000")}, 0)
            .to(($(this).find('.cardpic')), 0.5, {
              className: '+=tada'
            }, 0)
            element.animation = projectHover;
          });
          
        $('.avapreview').hover(over, out);
        function over(){ this.animation.play() };
        function out(){ this.animation.reverse() };  
      }
    },
  }
}
</script>
<style scoped>
@import "stylesheets/_variables";
.heading { 
  text-align: center;
  padding: 2em;
}
.group {
    
   
  @media (--only-small-screen) {
    lost-center: 570px;
  }
  @media (--only-medium-screen) {
    lost-center: 900px;
  }
  @media (--only-1600more-screen) {
    lost-center: 1070px;
  }
  
}
.avapreview {
  display: flex;
  lost-waffle: 1/3 3 2em;
  @media (--only-small-screen) {

    lost-waffle: 1/3 3 1em ;
    height:  13em;
  }
  @media (--only-medium-screen) {
    
    lost-waffle: 1/4 4 2em;
    height: 14em;
  }
  @media (--only-1600more-screen) {
    lost-waffle: 1/5 5 2em;
    height: 250px;
  }
}
.cardpic {
  width: 100%;
  border: 1px  solid $isabelline;
  cursor: pointer; 
  display: flex;
  border-radius: $borderRad; 
  align-items: flex-end;
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover; 
   
}
 
.bg {
  width: 100%;
  background-color: rgba(255, 255, 255, 0.8);
  position: relative;
}
.itemTitle {
  text-align: right;
  display: flex;
  justify-content: flex-end;
}
.descM {  
  overflow: hidden;
  padding-left: 0.5em;
  padding-right: 0.5em;
  width: 100%;
}
.desc {  
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
  display: flex;
  margin-top: 1em;
  @media (--only-small-screen) {
    margin-top: 0em;
  }
  @media (--only-medium-screen) {
    height:  20vw;
  }
  @media (--only-1600more-screen) {
    height:  180px;
  }
  .avatarSect1 {
    z-index: 10;
    background-color: #fff;
    box-shadow: 0px 2px 10px 0px #5c5c5c;
    border: 0.3em solid $isabelline;
    border-radius: 0em;
    margin: 0em 0 0 1em;
    display: flex; 
    align-items: flex-end;  
    justify-content: center;
     
    background-position: center;
    background-size: cover; 
    background-repeat: no-repeat;
    .fotoEdit {
      font-size: fs t;
      margin: 0.5em;
      padding: 0.1em;
      background-color: rgba(255, 255, 255, 0.5);
    }
    @media (--only-small-screen) {
      display:none;
    }
    @media (--only-medium-screen) {
      lost-column: 1/6 2 0 ; 
    }
    @media (--only-1600more-screen) {
      lost-column: 1/7 2 0 ; 
    }
  }
  .avatarSect2 {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 1em;
    margin-bottom: 2.5em;
    margin-top: 2.5em;
     .fioSpec { 
      margin-left: -3em;
      background-color: $isabelline;
      border-radius: 0.2em;
      @media (--only-small-screen) {
        margin-left: 0em;
      }
      h2 {
        background-color: #fff;
        padding: 0.2em  ;
        margin: 0.2em 0em 0.2em 1em;
        text-indent: 0.2em;
        @media (--only-small-screen) {
          margin-left: 0em;
        }
      }
      p {
        margin-left: 0em;
        margin-top: spacing(0.5);
        margin-bottom: spacing(0);
      }
      padding: 0.5em 1em 1em;
      @media (--only-small-screen) {
        p {
          text-indent: 0em;
          padding: 0;
        }
      }
    }
    p {
      text-align: center;
      margin-bottom: 0em;
      margin-top: 0em;
    }
    
    @media (--only-small-screen) {
      padding: 1em;
      h2 {
        adjust-font-size: fs xlarge;
        margin-bottom: spacing(0.1);
      }  
      p {
        adjust-font-size: fs s;
        line-height: 1.2em;
      }
      lost-column: 1/1 1 0;  
      margin-bottom: 0em;
      margin-top: 0em;
    }
    @media (--only-medium-screen) {
      lost-column: 5/6 2 0; 
    }
    @media (--only-1600more-screen) {
      lost-column: 6/7 2 0;
    }
    div {
      background-color: #faf;
    }
  }
}
.empDesc {
  padding-left: 1em;
  margin-bottom: 1em;
  p {
    margin-bottom: spacing(0);
    text-indent: 0em;
  }
  ul, ol {
    padding: 0em;
    margin-top: 0.2em;
  }
  @media (--only-small-screen) {
    p {
      margin-bottom: 0em;
    }
  }

}

/*--------*/
/* стиль эффекта тени блока с 2х сторон */
.effect2 {
  position: relative;
}
.effect2:before    {
  z-index: -1;
  position: absolute;
  content: "";
  bottom: 15px;
  left: 10px;
  width: 50%;
  top: 80%;
  max-width:300px;
  background: #777;
  -webkit-box-shadow: 0 15px 10px #777;
  -moz-box-shadow: 0 15px 10px #777;
  box-shadow: 0 15px 10px #777;
  -webkit-transform: rotate(-3deg);
  -moz-transform: rotate(-3deg);
  -o-transform: rotate(-3deg);
  -ms-transform: rotate(-3deg);
  transform: rotate(-3deg);
}
 
/*--------*/
.effect4
{
  position: relative;
}
.effect4:after
{
  z-index: -1;
  position: absolute;
  content: "";
  bottom: 15px;
  right: 10px;
  left: auto;
  width: 50%;
  top: 80%;
  max-width:300px;
  background: #777;
  -webkit-box-shadow: 0 15px 10px #777;
  -moz-box-shadow: 0 15px 10px #777;
  box-shadow: 0 15px 10px #777;
  -webkit-transform: rotate(3deg);
  -moz-transform: rotate(3deg);
  -o-transform: rotate(3deg);
  -ms-transform: rotate(3deg);
  transform: rotate(3deg);
}
</style>