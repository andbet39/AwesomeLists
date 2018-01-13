<template>
 <div>
     <p>{{list.stars}}</p>
 </div>
</template>

<script>

import axios from 'axios'

export default {
  data: function(){
      return {
          markdown:""
      }
  },
  props:['list'],
  watch: {
    
    list: function (newUrl) {
     
     
    }
  },
  created:function(){
     
  },
  methods:{
     
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
