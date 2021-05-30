// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Chart from "chart.js"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import '../stylesheets/application';
import Vue from 'vue'
// import Vuex from 'vuex'
import App1 from './home/PostNewPage.vue'
import App2 from './home/PostEditPage.vue'
import App3 from './like/LikeListPage.vue'
// import store from './store1.js'
//= require jquery_ujs
Rails.start()
Turbolinks.start()
ActiveStorage.start()
// Vue.use(Vuex)
Vue.config.productionTip = false
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app1',
    render: (h) => h(App1)
  }),
  new Vue({
    el: '#app2',
    render: (h) => h(App2)
  }),
  new Vue({
    el: '#app3',
    render: (h) => h(App3)
  })
})