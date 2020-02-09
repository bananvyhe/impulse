<template>
  <div >
    <!-- {{slide}}     -->
    <draggable v-model="slides" @end="employeeMoved">
      <div v-for="item in slide">
        <div class="slide" v-if="item.ssilka == null" v-bind:style="{backgroundImage: 'url('+ item.slide.url}">
   
        </div>
        <div v-else>
          <youtube :player-width="180" :player-height="120" v-if = "item.ssilka != null" :video-id="item.ssilka.split('/').pop()"></youtube>
        </div>
      </div>
    </draggable>

  </div>
</template>

<script>
import axios from 'axios'
import draggable from "vuedraggable"
export default {
  components: { draggable },
  data: function () {
    return {
      slide: '',
      slides: ''
    }
  },
  watch: {
 
  },
  methods: {
    employeeMoved: function(event) {
      var data = new FormData
      console.log(data)
      data.append("slider[position]", event.newIndex + 1)
      axios({
        method: 'PATCH',
        url: `/sliders/${this.slide[event.newIndex].id}/move`,
        // type: "PATCH",
        data: data,
        // dataType: "json",
        // success: this.getemps()
      }).then((response) => { 

        this.input = ''
        this.getemps()
        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      }) 

 
    },       
    getemps: function(){
      axios.get('/sliders')
      .then((response) => {
        this.slide = response.data;
        this.slides = Array.from(response.data)
        console.log(response.data)
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
 .slide {
  margin: 1em 0;
  height: 120px;
  width: 180px;
  background-size: cover;
 }
</style>