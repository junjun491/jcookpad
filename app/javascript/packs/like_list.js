import Vue from 'vue'
import App from './like/LikeListPage.vue'
Vue.config.productionTip = false
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    render: (h) => h(App)
  })
})