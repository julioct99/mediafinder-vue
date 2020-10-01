<template>
  <div class="col-lg-4 col-sm-6 mb-4">
    <div
      id="card"
      class="card bg-dark mb-3"
    >
      <img
        v-if="item.Poster !== 'N/A'"
        :src="item.Poster"
        class="card-img-top"
        alt="Poster"
      />
      <div class="card-body">
        <a :href="imdbLink">
          <h5 class="card-title">
            {{ item.Title }} <span class="item-year"> ({{ item.Year }})</span>
          </h5>
        </a>
        <p>{{ item.imdbVotes }} IMDB votes</p>
        <div class="d-flex justify-content-center align-items-center text-center">
          <div class="d-flex flex-column">
            <div class="col">
              <img
                class="icon"
                src="../assets/img/score_logos/imdb.png"
                alt="Score logo"
              />
            </div>
            <div class="col">
              <span class="score"> {{ item.imdbRating }} </span>
            </div>
          </div>
          <div
            v-if="item.Metascore !== 'N/A'"
            class="d-flex flex-column"
          >
            <div class="col">
              <img
                class="icon"
                src="../assets/img/score_logos/metacritic.png"
                alt="Score logo"
              />
            </div>
            <div class="col">
              <span class="score"> {{ item.Metascore }} </span>
            </div>
          </div>
          <div
            v-if="rtScore !== 'N/A'"
            class="d-flex flex-column"
          >
            <div class="col">
              <img
                class="icon"
                src="../assets/img/score_logos/rotten_tomatoes.png"
                alt="Score logo"
              />
            </div>
            <div class="col">
              <span class="score"> {{ item.Ratings[1].Value }} </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['item'],
  computed: {
    imdbLink() {
      return `https://www.imdb.com/title/${this.item.imdbID}`
    },
    rtScore() {
      if (this.item.Ratings[1] !== undefined) {
        return this.item.Ratings[1].Value
      } else {
        return 'N/A'
      }
    }
  }
}
</script>

<style scoped>
@import "~bootstrap/dist/css/bootstrap.css";

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

#card {
  box-shadow: 9px 9px 12px 5px rgba(0, 0, 0, 0.36);
}

#card:hover {
  box-shadow: 4px 4px 4px 2px #fce30581;
  transition: 0.2s;
}
</style>
