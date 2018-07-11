<template>
  <div class="feedback">
  	<div><h4>Отправьте нам сообщение:</h4></div>
    <el-form :model="dynamicValidateForm"  ref="numberValidateForm" >
    	<el-form-item 
        prop="name"
        :rules="[
          { required: true, message: 'Пожалуйста, введите имя', trigger: 'blur' },
        ]">
        <el-input placeholder="Введите имя" v-model="dynamicValidateForm.name"></el-input>
      </el-form-item>
      <el-form-item 
        prop="contact"
        :rules="[
          { required: true, message: 'Пожалуйста, введите контактные данные', trigger: 'blur' },
        ]">
      	<el-input placeholder="Контактная информация (тел, е-майл, ...)" v-model="dynamicValidateForm.contact">
          
        </el-input>
      </el-form-item>
      <el-form-item 
        prop="message">
      	<el-input
    		  type="textarea"
    		  :rows="4"
    		  placeholder="Введите сообщение"
    		  v-model="dynamicValidateForm.message">
    		</el-input>
      </el-form-item>
  		<el-button v-on:click="handler" type="success" plain>Отправить</el-button>
    </el-form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
     dynamicValidateForm: { 
    	name: '',
    	contact: '',
    	message: ''}
    }
  },
  methods: {
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    handler(){
      this.postfeed();
      this.open();
      this.resetForm('numberValidateForm');
    },
    open() {
      const h = this.$createElement;

      this.$notify({
        type: 'success',
        title: 'Спасибо',
        message: h('i', { style: 'color: teal' }, 'Ваше сообщение отправлено.')
      });
    },
    postfeed() {
      axios.post('/feedbacks', {
      name: this.dynamicValidateForm.name,
      contact: this.dynamicValidateForm.contact,
      message: this.dynamicValidateForm.message
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