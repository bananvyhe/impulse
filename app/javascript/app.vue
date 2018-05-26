<template>
  <div id="app">
    <div class="testfont">
       <h4>{{ message }}</h4>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Сайт на обновлении..."
    }
  }
}
</script>

<style scoped>
#app {
  lost-center: 600px;
}

h4 {
  text-align: center;
}
</style>
