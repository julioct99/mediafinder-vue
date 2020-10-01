<template>
  <form
    id="search-form"
    @submit.prevent="$emit('search', query)"
  >
    <div class="input-group flex-nowrap mb-5 px-lg-3">
      <div class="input-group-prepend">
        <span
          class="input-group-text bg-primary"
          id="addon-wrapping"
        >
          <i
            id="search-icon"
            class="fa fa-search"
            aria-hidden="true"
          ></i>
        </span>
      </div>
      <input
        v-model="query"
        type="search"
        name="search"
        id="search"
        class="form-control"
        placeholder="Search any movie, TV show or videogame"
        aria-label="Search"
        autocomplete="off"
      >
      <div class="input-group-append">
        <button
          type="submit"
          class="btn btn-primary"
        >SEARCH</button>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  data() {
    return {
      query: ''
    }
  }
}
</script>

<style scoped>
@import "~bootstrap/dist/css/bootstrap.css";

#search-icon{
  color: white;
}

#search::-webkit-search-cancel-button{
    cursor: pointer;
}
</style>
