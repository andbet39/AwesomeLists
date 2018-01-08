/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks';
import VueRouter from 'vue-router'
import InstantSearch from 'vue-instantsearch';


import App from '../app.vue'
import TestPage from '../testpage.vue'

const routes = [
  {path: '/', name: 'home', component: TestPage },
];

const router = new VueRouter({
  routes
});

Vue.use(VueRouter)
Vue.use(TurbolinksAdapter)
Vue.use(InstantSearch);

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#main',
    router,
    components: { App }
  })

})