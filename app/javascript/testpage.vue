<template>
<div>
    <div class="row">
      <div class="col">
          <ais-search-box :search-store="searchStore">
                <div class="input-group">
                  <ais-input :search-store="searchStore" @query="onSearch"
                  placeholder="Search Awsome..."
                  :class-names="{
                    'ais-input': 'form-control'
                    }"
                  ></ais-input>
                </div>
              </ais-search-box>
      </div>
    </div>

    <div v-if="!searched && loaded_lists" class="row">
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

    <div v-if="searched && result_visible" class="row">
      <div class="col">
          <ais-index  :search-store="searchStore" index-name="List">  
                <div v-if="result_visible">
                <ais-results class="row">
                    <template slot-scope="{ result }">
                      <div @click="selectList(result)" class="col-md-3">
                        <list-card  :list="result"></list-card>
                      </div>
                      
                    </template>
                  </ais-results>
                </div>
            </ais-index>
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
  import { createFromAlgoliaCredentials } from 'vue-instantsearch';

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
      query:gql`query{
                allLists{
                  name,
                  pushed_at,
                  readme_raw_path,
                  url,
                  stars
                }
              }`,
      update(data){
        console.log(data)
        this.loaded_lists=true
        return data.allLists
      }
    }
  },
  data: function(){
    return {
      selected_list :null,
      result_visible:true,    
       searchStore: createFromAlgoliaCredentials('NX661ZD19H', '365e479d2a6cd379a0afa4cdcbef1018'),
       lists:[],
       loaded_lists:false,
       searched:false

    }
  },
  created:function(){
  },
  methods:{
    selectList:function(list){
      this.selected_list = list
      this.result_visible = false
    },
    onSearch:function(query){
      console.log(query)
      this.searched=true
      this.result_visible=true
      
      if(query==""){
        this.loaded_lists=true
        this.searched=false
      }
    },
    onClose:function(){
      this.result_visible=true
    }
  }
}
</script>

<style scoped>

</style>
