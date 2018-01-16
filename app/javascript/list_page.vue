<template>
<div>
    <div v-if="loaded_lists" class="row">
      <div class="col">
          <div v-if="result_visible">
                <div class="row">
                      <div v-for="result in lists" :key="result.id" @click="selectList(result)" class="col-md-3">
                        <list-card  :list="result"></list-card>
                      </div>                
                </div>
          </div>
      </div>
    </div>

      <div  class="row">
          <div class="col">
           <list-preview @close="onClose" :list="selected_list" v-if=" result_visible != true"></list-preview>
          </div>
      </div>
</div>

</template>

<script>

import ListPreview from './list_preview.vue'
import ListCard from './list_card.vue'
import gql from 'graphql-tag'

export default {
  components:{
    'list-preview':ListPreview,
    'list-card':ListCard
  },
  apollo:{
    lists:{
      query:gql`query GetList($filter:ListFilter, $order: ListOrder!){
                lists(filter:$filter, order : $order){
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
            order: this.ordering,
            filter:{'contains':this.searchstring}
        }
    },
      update(data){
        this.loaded_lists=true
        this.onSearch()
        return data.lists
      }
    }
  },
  props:['searchstring','ordering'],
  
  data: function(){
    return {
      selected_list :null,
      result_visible:true,    
       lists:[],
       loaded_lists:false,
       search_str:""
    }
  },
  created:function(){
  },
  methods:{
    selectList:function(list){
          this.$router.push({ name: 'preview', params: { listId: list.id }})
      },
    onSearch:function(){
    },
    onClose:function(){
    }
  }
}
</script>

<style scoped>

</style>
