<template>
  <div class="adult">
  	<div>
  		<h4>Взрослым</h4>
  	</div>
 		<div v-for="(item, index) in items" class="bganim">
      <div class="bgstring2">
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
        { title: 'Индивидуальная консультация психолога', url: '#'},
        { title: 'Семейное консультирование', url: '#'},
        { title: 'Тренинги и семинары для взрослых', url: '#'},
        { title: 'Психодиагностика', url: '#'},
        { title: 'Профориентирование', url: '#'},
        { title: 'Личная психотерапия и супервизия для психологов', url: '#'} 
      ] 
    }
  },
  mounted() {
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
.hrline {
  @extend %hrline;
  margin: 0.1em 0 0.2em -0.5em;
  background-color: $str1;
} 
.adult {
  overflow: hidden;
  display: flex;
  flex-direction: column;
   
  h4 {
    color: $str4;
    margin: 0 0 0 0;
  }
}
.bgstring2 {
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