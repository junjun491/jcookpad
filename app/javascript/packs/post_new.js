import Vue from 'vue'
import App from './home/PostNewPage.vue'
Vue.config.productionTip = false
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    render: (h) => h(App)
  })
})