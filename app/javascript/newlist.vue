<template>
 <div>

     <div>
        <form-wizard @on-complete="addList" 
                      shape="square"
                      color="#3498db">
            <tab-content title="List information"
                         icon="ti-user">
                <input placeholders="List name" type="text" v-model="list_name" />
                <input placeholders="List description" type="text" v-model="list_description" />
            </tab-content>
            <tab-content title="Github URL"
                         icon="ti-settings">
                  <input type="text" v-model="list_url" v-on:keyup.enter="updateListInfo"/>
            </tab-content>
            <tab-content title="Check all..."
                         icon="ti-check">
                    <h1>{{list_name}}</h1>
                    <p>{{list_description}}</p>
                    <list-preview v-if="this.list !=null " :list="this.list"/>
            </tab-content>
        </form-wizard>
    </div>

 </div>
</template>

<script>

import axios from 'axios'
import ListPreview from './list_preview.vue'
export default {
  data: function(){
      return {
          list_url:"",
          list_name:"",
          list_description:"",
          list:null
      }
  },
  components:{
      'list-preview':ListPreview
  },
  methods:{
      updateListInfo(){
          const data = {'list_url':this.list_url}

          this.$http.post('/api/getlistinfo',data).then((resp)=>{
              console.log(resp)
              this.list  = resp.data
              this.list.name = this.list_name
              this.list.description = this.list_description
          })
      },
      addList(){
        
          this.$http.post('/lists.json',this.list).then((resp)=>{
              console.log(resp.data)
              this.list=resp.data
              this.$router.push({'name':'home'})
          })
      }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
