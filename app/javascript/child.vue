<template>
  <div class="child">
  	<div>
      <h4>Детям и подросткам</h4>
      <div class="hrline scale-in-hor-right"></div>
  	</div>
 		<div v-for="(item, index) in items" class="bganim">
      <div class="bgstring">
        {{item.title}}        
      </div>
 		</div>
  </div>
</template>

<script>


export default {
  data: function () {
    return {
    	items: [
        { title: 'Детский психолог', url: '#'},
        { title: 'Нейропсихологическая диагностика и коррекция', url: '#'},
        { title: 'Группы развития для детей (от 1 года до 7 лет)', url: '#'},
        { title: 'Развитие памяти и внимания (7-10 лет)', url: '#'},
        { title: 'Нейрограмматика (коррекция чтения и письма) (7-10 лет)', url: '#'},
        { title: 'Нейроматематика (7-10 лет)', url: '#'},
        { title: 'Нейробика (11-13 лет)', url: '#'},
        { title: 'Тренинги для детей и подростков (7-14 лет)', url: '#'},
        { title: 'Психодиагностика', url: '#'},
        { title: 'Профориентирование', url: '#'},
        { title: 'Логопед-дефектолог', url: '#'}     
      ] 
    }
  },
  mounted() {
    var menuitems = $('.bgstring').toArray();
    var m2 = (menuitems.length/2).toFixed();
    var m3 = menuitems.splice(m2).reverse();
 
    TweenMax.staggerFrom(menuitems, 0.2, {
      opacity: 0,
      delay: 0.35,
      scale: 0.1,
      left: "230px",
      ease: Power4.easeOut
    },.30);
    TweenMax.staggerFrom(m3, 0.2, {
      opacity: 0,
      delay: 0.50,
      scale: 0.2,
      left: "230px",
      ease: Power4.easeOut
    },.30);
  }
}
</script>
<style scoped>
@import "stylesheets/_variables";
.hrline {
  @extend %hrline;
  margin: 0.1em 0 0.2em -0.5em;
  background-color: $str1;
} 
.child {
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
  display: inline-block;
  position: relative;
  @extend %bgstring;
  &:hover {
    color: #fff;
    background-color: $str4;
  }
}
.bganim {
   
}


 
</style>