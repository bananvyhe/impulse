<template>
  <div class="head">
		 
      <div class="first">
      </div>    
    <transition name="fade" > 
    <div class="second smalltext" v-if="contacts && contacts.length">
      <div v-for="contact of contacts">
        <h5>Адрес электронной почты:</h5>
        <p>{{contact.mail}}</p>
      </div>
    </div>
  </transition>
  <transition name="fade" >
    <div class="third smalltext" v-if="contacts && contacts.length">
      <div v-for="contact of contacts">
        <h5>Контакты:</h5>
        <p>{{contact.adress}}</p>
      </div>
    </div>
    </transition>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      contacts: []
    }
  },
  created() {
    axios.get('/contacts')
    .then(response => {
      this.contacts = response.data
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    }); 
  },
}
</script>
<style scoped>
@import "stylesheets/_variables";
p {
  margin-bottom: spacing(0);
}
.head { 
  display: flex;
	background-position: center left;
	height: 160px; 
  @media (--only-xsmall-screen) {
     
    background-position: top;
     background-repeat: no-repeat;
    background-position: center 25%;
 
    background-image: url(images/logo.svg);
    -webkit-background-size: 90%;
    background-size: 90%;
  }
 
}
.first { 
  background-image: url(images/logo.svg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: contain;
  margin: 3em 1em -1em 1em;
	lost-column: 1/2 4 0.5em;
  @media (--only-xsmall-screen) {
    display: none;
  }
  @media (--only-small-screen) {
    lost-column: 1/3 3 0.5em;
     background-size: 145%;
     background-position: 4% center;
  }
 
}
.third, .second { 
   
  lost-column: 1/4 4 1em;
  display: flex;
  align-self: center;
  line-height: 1.2;
  @media (--only-xsmall-screen) {

   lost-column: 1/2 2 0.5em;
   h5 {
     
    line-height: 1;
    margin-bottom: 0;
   }
   
  }
  @media (--only-small-screen) {
    lost-column: 1/3 3 0.5em;
    margin-top: 2em;
    padding: 0.2em;
  }
}
.second {
  z-index: 10;
  justify-content: flex-end;
  text-align: right;
  margin-top: 5em;
  padding: 0.5em;
  padding-bottom: 0em;
  @media (--only-xsmall-screen) {
   word-spacing: 100px;
  }
}
.third {
  z-index: 10;
  margin-top: 5em;
  padding: 0.5em;
  padding-bottom: 0em;
  max-width: 300px;
}
.fade-enter {
  opacity: 0;
}
.fade-enter-active {
  transition: opacity 1s;
}
.fade-leave {
  
}
.fade-leave-active {
  transition: opacity 1s;
  opacity: 0;
}
</style>