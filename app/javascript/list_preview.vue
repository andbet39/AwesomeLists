<template>
 <div class="list-preview">
      <div class="row justify-content-center align-items-center">
        <div class="col-md-10">
            <div class="card">
              <div class="card-header">
                <a :href="list.url" target="_blank"><img class="git-icon" src="https://assets-cdn.github.com/images/modules/logos_page/Octocat.png" alt="">View on GitHub</a>
                <div class="float-right">Votes : {{list.total_votes}} </div>
                
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
import gql from 'graphql-tag'

export default {
  components:{
    VueMarkdown
  },
  apollo:{
    list:{
      query:gql`query GetList($list_id:Int){
                	list(listid:$list_id){
                  id,
                  name,
                  pushed_at,
                  readme_raw_path,
                  url,
                  stars
                }
              }`,
      variables() {
      // Use vue reactive properties here
        return {
            list_id: parseInt(this.$route.params.listId)
            
        }
      },
      update(data){
        this.list = data.list
        this.loadReadme()
        return data.list
      }
      }
    },
  data: function(){
      return {
          list:{},
          markdown:""
      }
  },
  methods:{
    loadReadme:function(){
      axios.get(this.list.readme_raw_path).then((resp)=>{
                  this.markdown=resp.data
            })
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
