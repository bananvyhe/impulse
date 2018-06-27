<template>
  <div class="adult">
  	<div class="ubuntu">
  		Взрослым
  	</div>
 		<div v-for="(item, index) in items">
 			{{item.title}}
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
  }
}
</script>

<style scoped>
.child {
	display: flex;
  flex-direction: column;
} 
</style>