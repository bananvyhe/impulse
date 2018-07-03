/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import axios from 'axios'
import Vue from 'vue/dist/vue.esm.js'
import App from '../app.vue'
import Head from '../head.vue'
import Employees from '../employees.vue'
import Price from '../telpanel.vue' 
import Feedback from '../feedback.vue'
import Sliderapp from '../sliderapp.vue'
import Child from '../child.vue'
import Adult from '../adult.vue'
import News from '../news.vue'
import Mainmenu from '../mainmenu.vue' 
import Userlist from '../userlist.vue'  
// import 'element-ui/lib/theme-chalk/index.css';
import { Carousel, CarouselItem, Input, Button, Table, TableColumn, Col, Form, FormItem, Pagination, Dialog } from 'element-ui'
Vue.use(Carousel)
Vue.use(CarouselItem) 
Vue.use(Button) 
Vue.use(Pagination)
Vue.use(Dialog)
 Vue.use(Input) 
 Vue.use(Table)
 Vue.use(TableColumn)
 Vue.use(Col) 
 Vue.use(Form)
 Vue.use(FormItem)

document.addEventListener('DOMContentLoaded', () => {
	Vue.directive('scroll', {
    // Когда привязанный элемент вставляется в DOM............ss 
    inserted: function(el, binding) {
      let f = function(evt) {
        if (binding.value(evt, el)) {
          window.removeEventListener('scroll', _.throttle(f, 300));
        }
      };
      window.addEventListener('scroll', _.throttle(f, 300));
    },
  });
	let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common['X-CSRF-Token'] = token
  axios.defaults.headers.common['Accept'] = 'application/json' 
  new Vue({
    el: '#mainmenu',
    render: h => h(Mainmenu)
  }) 
  var news = document.getElementById("news") 
  if (news != null) {
    new Vue({
      el: '#news',
      render: h => h(News)
    }) 
  }
  // var news = document.getElementById("userlist") 
  // if (news != null) {
  //   new Vue({
  //     el: '#userlist',
  //     template: '<Price/>',
  //     components: {Price}
  //   }) 
  // }

  var userlist = document.getElementById("userlist")
  if (userlist != null) {
    new Vue({
      el: userlist,
      template: '<Userlist/>',
      components: {Userlist}
    })
  }
  var element = document.getElementById("adult")
  if (element != null) {
    new Vue({
      el: '#adult',
      render: h => h(Adult)
    })
  }
  var element = document.getElementById("child")
  if (element != null) {
    new Vue({
      el: '#child',
      render: h => h(Child)
    })
  }
  var element = document.getElementById("sliderapp")
  if (element != null) {
    new Vue({
      el: '#sliderapp',
      render: h => h(Sliderapp)
    })
  }
  var feedback = document.getElementById("feedback") 
  if (feedback != null) {
    new Vue({
      el: '#feedback',
      render: h => h(Feedback)
    }) 
  } 
  var price = document.getElementById("team-form")
  if (price != null) {
    var app = new Vue({
      el: price,
      template: '<Price/>',
      components: {Price}
    }) 
  }
	var app = document.getElementById("app") 
	if (app != null) {
	  new Vue({
	    el: '#app',
	    render: h => h(App)
	  })
	}
  new Vue({
    el: '#head',
    render: h => h(Head)
  })
  var element = document.getElementById("employees")
  if (element != null) {
	  new Vue({
	    el: '#employees',
	    render: h => h(Employees)
	  })
	}
})




// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks';
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
