<template>
  <div id="app">
    <div class="testfont">
      <span>{{ message }}</span>
    </div>
  </div>
</template>
<script>
export default {
  data: function () {
    return {
      message: "Сайт в процессе обновления"
    }
  }
}
</script>
<style scoped>
#app {
  lost-center: 600px;
}
p {
  text-indent: 0em;
  text-align: center;
}
</style>
