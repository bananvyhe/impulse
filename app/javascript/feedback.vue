<template>
  <div class="feedback">
  	<div><h4>Отправьте нам сообщение:</h4></div>
  	<el-input placeholder="Как к вам обращаться?" v-model="name"></el-input>
  	<el-input placeholder="Контактная информация (тел, е-майл, ...)" v-model="contact"></el-input>
  	<el-input
		  type="textarea"
		  :rows="4"
		  placeholder="Введите сообщение"
		  v-model="message">
		</el-input>
		<el-button v-on:click="postfeed" type="success" plain>Отправить</el-button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
    	name: '',
    	contact: '',
    	message: ''
    }
  },
  methods: {
    postfeed() {
      axios.post('/feedbacks', {
      name: this.name,
      contact: this.contact,
      message: this.message
      }).then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
h4 {
  color: $str4;
  margin: 0 0 0.5em 0;
}
.hrline { 
	width: 16em; 
	/*@mixin hrline;*/
	margin: 0.1em 0 0.5em 0em;
	background-color: $str4;
}
.el-button {
  margin-top: 0.5em;
}
 
</style>