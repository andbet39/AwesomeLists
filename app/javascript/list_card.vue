<template>
    
        <div class="card card-outline-primary text-center">
            <div class="card-block">
                <div class="card-title list-name">
                    <a href="" v-on:click.prevent="" >{{list.name}}</a>
                </div>
            </div>
            <p class="list-name"></p>
            <footer>&#x2605;{{list.stars}} <span class="last-upd">Last upd {{list.pushed_at | moment("from", "now")}}</span></footer>

</div>

</template>

<script>
    export default {
        props:['list']
    }
</script>

<style scoped>
 .card{
     height: 100px;
     margin: 10px;
     padding: 5px;
 }

 .last-upd{
     font-size: 10px
 }
.card-title{
    height: 50px;
}
 .list-name{
     font-size: 0.8rem;
     font-weight: 500;
     padding: 2px;
     margin:2px;
 }
</style>