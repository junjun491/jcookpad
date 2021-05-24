import VueRouter from 'vue-router';
import PostNewPage from './home/PostNewPage.vue'
import PostEditPage from './home/PostEditPage.vue'

const routes = [
  {path: '/', component: PostNewPage },
  {path: '/edit', component: PostEditPage }
  ];

export default new VueRouter({ routes });
