<template>
  <div >
    <div    v-for="item in slide">
      <div v-if="item.ssilka == null" v-bind:style="{backgroundImage: 'url('+ item.slide.url}">
        {{item}}
      </div>
      <div v-else>
        <youtube     :player-width="100" :player-height="60" v-if = "item.ssilka != null" :video-id="item.ssilka.split('/').pop()"></youtube>
      </div>
    </div>
    <!-- {{slide}} -->
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      slide: ''
    }
  },
  watch: {
 
  },
  methods: {
    getemps: function(){
      axios.get('/sliders')
      .then((response) => {
        this.slide = response.data;
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },   
  },
  created() {
    this.getemps()
  },
  mounted() {
 
  },
  updated(){
  },
  beforeUpdate() {
  }
} 
</script>

<style scoped>
@import "stylesheets/_variables";
 
</style>