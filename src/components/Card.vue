<template>
  <div class="col-lg-4 col-sm-6 mb-4">
    <div class="card bg-dark mb-3">
      <img
        :src="item.Poster"
        class="card-img-top"
        alt="Poster"
      >
      <div class="card-body">
        <a :href="imdbLink">
          <h5 class="card-title"> {{item.Title}} <span class="item-year"> (YEAR)</span></h5>
        </a>
        <p>N IMDB votes</p>
        <div class="d-flex justify-content-center align-items-center text-center">
          <div class="d-flex flex-column">
            <div class="row align-items-center mb-2">
              <div class="col">
                <img
                  class="icon"
                  src=""
                  alt="Score logo"
                >
              </div>
              <div class="col">
                <span class="score">5</span>
              </div>
            </div>
          </div>
          <!-- ${mcHTML}
          ${rtHTML} -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['item'],
  data() {
    return {

    }
  },
  computed: {
    imdbLink() {
      return `https://www.imdb.com/title/${this.item.imdbID}`
    }
  }
}
</script>

<style scoped>
* {
  font-family: "Roboto", sans-serif;
}

h5 {
  font-weight: bolder;
}

a {
  color: #00a2ff;
}

i,
p,
.score {
  color: white;
}

a:hover {
  text-decoration: none;
  transition: 0.2s ease-in-out;
  color: #fce205;
  text-shadow: 0px 0px 5px black;
}

.icon {
  width: 40px;
}

.score {
  font-weight: bolder;
  font-size: 1.75rem;
}

@import "~bootstrap/dist/css/bootstrap.css";
</style>
