<template>
  <div id="app" class="container">
      <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="#">Awesome</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          
        </ul>
        <form class="form-inline my-4 my-lg-0">
          <input class="form-control mr-sm-4" type="text" v-model="searchstring" @input="onSearch" placeholder="Search Awesome" aria-label="Search">
           <div class="btn-group" role="group" aria-label="Basic example">
                  <button type="button" @click="ordering='STARRED'" class="btn btn-secondary" :class="ordering == 'STARRED' ? 'active' : '' ">Star</button>
                  <button type="button" @click="ordering='RECENT'" class="btn btn-secondary" :class="ordering == 'RECENT' ? 'active' : ''">Recent</button>
                  <button type="button" @click="ordering='NAME'" class="btn btn-secondary" :class="ordering == 'NAME' ? 'active' : ''">Alphabet</button>
                </div>
        </form>
      </div>
    </nav>
      <router-view :searchstring="searchstring" :ordering="ordering"></router-view>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      searchstring:"",
      ordering:"STARRED"
    }
  },
  methods:{
      onSearch(e){
          if(this.$route.path != '/'){
              this.$router.push('/')
          }
      }
  }
}
</script>

<style scoped>

</style>
