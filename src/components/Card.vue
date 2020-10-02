<template>
  <div class="col-lg-3 col-sm-4 mb-4">
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
      <div class="card-body text-center">
        <a :href="imdbLink">
          <h5 class="card-title">
            {{ item.Title }} <span class="item-year"> ({{ item.Year }})</span>
          </h5>
        </a>
        <p>{{ item.imdbVotes }} IMDB votes</p>
        <div class="d-flex justify-content-center align-items-center text-center mt-3">
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
              <span :class="{'score-good': goodScore('mc'), 'score-bad': !goodScore('mc')}">
                {{ item.Metascore }}
              </span>
            </div>
          </div>
          <div class="d-flex flex-column">
            <div class="col">
              <img
                class="icon"
                src="../assets/img/score_logos/imdb.png"
                alt="Score logo"
              />
            </div>
            <div class="col">
              <span :class="{'score-good': goodScore('imdb'), 'score-bad': !goodScore('imdb')}">
                {{ item.imdbRating }}
              </span>
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
              <span :class="{'score-good': goodScore('rt'), 'score-bad': !goodScore('rt')}">
                {{ item.Ratings[1].Value }}
              </span>
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
  },
  methods: {
    goodScore(site) {
      if (site === 'imdb') {
        return this.item.imdbRating >= '5.0'
      } else if (site === 'mc') {
        return this.item.Metascore >= '50'
      } else {
        return this.item.Ratings[1].Value >= '50%' || this.item.Ratings[1].Value === '100%'
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
  font-weight: bold;
  font-size: 1.25rem;
  margin-bottom: 20px;
}

a {
  color: #00a2ff;
}

i,
p,
.score {
  color: white;
}

p {
  font-size: 0.85rem;
}

a:hover {
  text-decoration: none;
  transition: 0.2s ease-in-out;
  color: #fce205;
  text-shadow: 0px 0px 5px black;
}

.icon {
  width: 35px;
}

.score-good,
.score-bad {
  font-size: 1.25rem;
}

.score-good {
  color: rgb(0, 212, 0);
  text-shadow: 2px 2px 4px green;
}

.score-bad {
  color: red;
  text-shadow: 2px 2px 4px red;
}

#card {
  box-shadow: 9px 9px 12px 5px rgba(0, 0, 0, 0.36);
  border: none;
}

#card:hover {
  box-shadow: 4px 4px 4px 2px #fce30581;
  transition: 0.2s;
}
</style>
