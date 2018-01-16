<template>
  <div id="app">
       <router-view></router-view>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      search_string:""
    }
  }
}
</script>

<style scoped>
  body{
    padding-top: 70px;
  }
</style>
