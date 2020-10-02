<template>
  <div
    id="background"
    class="pb-5"
  >
    <div class="container pt-5">
      <Searchbox @search="loadIds($event)"></Searchbox>
      <transition-group
        name="slide-fade"
        class="row card-group"
      >
        <Card
          v-for="item in sortedItems"
          :key="item.imdbID"
          :item="item"
        ></Card>
      </transition-group>

      <div
        id="loading"
        class="row justify-content-center hidden"
        v-show="loading"
      >
        <img
          src="./assets/animations/loading.gif"
          width="30%"
        >
      </div>
    </div>
  </div>
</template>

<script>
import Card from './components/Card.vue'
import Searchbox from './components/Searchbox.vue'
import axios from 'axios'

export default {
  data() {
    return {
      ids: [],
      items: [],
      query: '',
      loading: false
    }
  },
  computed: {
    sortedItems() {
      return this.items.slice().sort((a, b) => {
        return Number(b.imdbVotes.replace(/,/g, '')) - Number(a.imdbVotes.replace(/,/g, ''))
      })
    }
  },
  components: {
    Card,
    Searchbox
  },
  methods: {
    loadIds(query) {
      // Display the loading animation for 2 seconds
      this.loading = true
      setTimeout(() => {
        this.loading = false
      }, 2000)

      console.log(query)
      this.ids = []
      this.items = []
      let page = 1
      while (page < 5) {
        axios
          .get(`http://www.omdbapi.com/?s=${query}&apikey=thewdb&page=${page}`)
          .then(res => {
            const items = res.data.Search
            if (items) {
              items.forEach((item, index) => {
                this.loadItem(item.imdbID)
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
          if (item.imdbVotes !== 'N/A' && !this.items.includes(item)) {
            this.items.push(item)
          }
        })
        .catch(err => console.log(err))
    }
  }
}
</script>

<style scoped>
@import "~bootstrap/dist/css/bootstrap.css";

#background {
  background: #20201e;
  min-height: 100vh;
}

.slide-fade-enter-active {
  transition: all 0.6s ease;
}
.slide-fade-leave-active {
  transition: all 0.4s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter,
.slide-fade-leave-to {
  transform: translateY(-20px);
  opacity: 0;
}
</style>
