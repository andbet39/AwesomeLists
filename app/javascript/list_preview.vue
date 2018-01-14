<template>
 <div class="list-preview">
      <div class="row justify-content-center align-items-center">
        <div class="col-md-10">
            <div class="card">
              <div class="card-header">
                <a :href="list.url" target="_blank"><img class="git-icon" src="https://assets-cdn.github.com/images/modules/logos_page/Octocat.png" alt="">View on GitHub</a>
                <button class="btn btn-success float-right" @click="close">Close</button>
              </div>
              <div class="card-block list-content">
                  <vue-markdown :source="markdown"></vue-markdown>
              </div>
            </div>
      </div>
      </div>
 </div>
</template>

<script>

import axios from 'axios'
import VueMarkdown from 'vue-markdown'

export default {
  components:{
    VueMarkdown
  },
  data: function(){
      return {
          markdown:""
      }
  },
  props:['list'],
  created:function(){
    axios.get(this.list.readme_raw_path).then((resp)=>{
                this.markdown=resp.data
          })
  },
  watch: {
    
    list: function (newlist) {
     console.log("NewList")
     axios.get(this.list.readme_raw_path).then((resp)=>{
            this.markdown=resp.data
       })
     
    }
  },
  methods:{
    close:function(){
      this.$emit('close')
    }   
  }
}
</script>

<style scoped>
.git-icon {
  height: 35px;
}
.list-content {
  margin-left: 20px;
  margin-right: 20px;
  line-height: 1.2em;
}
.list-preview{
  padding-top: 20px;
}
a:hover{
  background-color:white;
}
</style>
