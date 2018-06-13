<template>
  <div>
    <div  v-for="item of employee">
      <div class="topSectAv">
        <div class="avatarSect1"  v-bind:style="{backgroundImage: 'url('+ item.avatar.thumb.url}">
        </div>
        <div class="avatarSect2">
          <div class="fioSpec  effect4">{{item.name}}
          </div>
        </div>  
      </div>
      <div class="empDesc"><span v-html="item.desc"></span>
      </div>      
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      employee: ''
    }
  },
  created() {
    axios.get('/employees')
    .then((response) => {
      this.employee = response.data;
    })
    .catch(function (error) {
      console.log(error);
    }); 
    },
  methods: {
  }
}
</script>
<style scoped>
</style>