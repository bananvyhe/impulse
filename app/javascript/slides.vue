<template>
  <div >
    <!-- {{slide}}     -->
    <draggable  @end="employeeMoved"  v-model="slide">
      <div v-for="item in slide" class="slideitem">
        <div class="slide" v-if="item.ssilka == null" v-bind:style="{backgroundImage: 'url('+ item.slide.url}">
   
        </div>
        <div v-else class="youtcard">
          <div  class="youtdrag" >

            <youtube :player-width="100" :player-height="80" v-if = "item.ssilka != null" :video-id="item.ssilka.split('/').pop()">
              
            </youtube>
          </div>
          <div class="smalltext">{{item.ssilka }}</div>
        </div>
        <div class="butplace">
          <el-button   type='danger' size='mini' icon="el-icon-delete" circle @click="deleting(item.id)" class="but"> 
          </el-button> 
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
    deleting(id){
      console.log(id)
      axios.delete('/sliders/'+id,{
        headers: {
          // 'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
           this.getemps()   
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
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
.butplace {
}

.but {
  margin: 5.5em 0.5em 0;
}
.slideitem {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.youtcard {
  background-color: #ada;
    height: 120px;
  width: 180px;
}
.youtdrag {
  height: 80px;
  width: 100px;
}
 .slide {
  margin: 1em 0;
  height: 120px;
  width: 180px;
  background-size: cover;
 }
</style>