<template>
  <div id="app">
    <p>{{ message }}</p>
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
p {
  font-size: 1em;
  text-align: center;
  color: gray;
}
</style>
