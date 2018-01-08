<template>
  <ais-index
    app-id="NX661ZD19H"
    api-key="365e479d2a6cd379a0afa4cdcbef1018"
    index-name="List"
  >
    <ais-search-box></ais-search-box>

    <ul>
  <ais-results>
      <template slot-scope="{ result }">
          <li><a :href="result.url">{{result.name}}</a> {{result.stars}} &#x2605; - {{result.description}}</li>

      </template>
    </ais-results>
    </ul>
  
  </ais-index>
</template>

<script>
export default {
  
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
