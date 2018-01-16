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

import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'

import App from '../app.vue'
import MainPage from '../main_page.vue'
import ListPage from '../list_page.vue'
import NewListPage from '../newlist.vue'
import ListPreview from '../list_preview.vue'
import axios  from 'axios'
import VueFormWizard from 'vue-form-wizard'
import 'vue-form-wizard/dist/vue-form-wizard.min.css'
import VueMarkdown from 'vue-markdown'


var token = $('meta[name="csrf-token"]').attr('content');

const routes = [
  {path: '/', name: 'home', component: MainPage,
  children: [
    {
      path: '/',
      component: ListPage
    },
    {
      path: 'preview/:listId',
      component: ListPreview,
      name:'preview'
    }]},
  {path: '/new', name: 'new', component: NewListPage },
];

const router = new VueRouter({
  routes
});


const httpLink = new HttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:3000/graphql',
  credentials: 'same-origin',
  headers: {
   'X-CSRF-Token': token
  }
})

// Create the apollo client
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: true,
})



// Install the vue plugin
Vue.use(VueApollo)

//axios.defaults.headers.common['X-CSRF-Token'] = token;

Vue.prototype.$http = axios;
Vue.use(require('vue-moment'));
Vue.use(VueRouter)
Vue.use(TurbolinksAdapter)
Vue.use(InstantSearch);
Vue.use(VueFormWizard)
Vue.use(VueMarkdown)

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
})

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#main',
    router,
    apolloProvider,
    components: { App }
  })

})