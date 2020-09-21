<template>
  <div id="background">
    <div class="container mb-5">
      <form
        @submit.prevent="loadIds"
        class="mb-5"
      >
        <input
          type="text"
          v-model="query"
        >
      </form>
      <div class="row card-group">
        <Card
          v-for="item in items"
          :key="item.imdbID"
          :item="item"
        ></Card>
      </div>
    </div>
  </div>
</template>

<script>
import Card from './components/Card.vue'
import axios from 'axios'

export default {
  data() {
    return {
      ids: [],
      items: [],
      query: 'star'
    }
  },
  components: {
    Card
  },
  methods: {
    loadIds() {
      console.log(this.query)
      this.ids = []
      this.items = []
      let page = 1
      while (page < 4) {
        axios
          .get(`http://www.omdbapi.com/?s=${this.query}&apikey=thewdb&page=${page}`)
          .then(res => {
            const items = res.data.Search
            if (items) {
              items.forEach((item, index) => {
                this.loadItem(item.imdbID)
                this.ids.push(item.imdbID)
              })
            } else if (page === 1) {
              // showMessage('No results found')
            }
          })
          .catch(err => {
            console.log(err)
          })
        page++
      }
    },
    loadItem(id) {
      axios
        .get(`http://www.omdbapi.com/?i=${id}&apikey=thewdb`)
        .then(res => {
          const item = res.data
          this.items.push(item)
        })
        .catch(err => console.log(err))
    }
  },
  created() {
    this.loadIds(this.query)
  }
}
</script>

<style>
#background {
  background: #232526;
}

@import "~bootstrap/dist/css/bootstrap.css";
</style>
