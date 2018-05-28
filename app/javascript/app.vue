<template>
  <div id="app">
    <div class="testfont">
       <p>{{ message }}</p>
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
  margin: 0 0 0.6em 0;
  text-indent: 0em;
  text-align: center;
}
</style>
