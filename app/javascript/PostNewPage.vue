<template>
  <form @submit.prevent="createPost">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="post.rname" type="text">
    </div>
    <div>
      <label>rinformation</label>
      <input v-model="post.rinformation" type="text">
    </div>
    <div>
      <label>rimage</label>
      <input v-model="post.rimage" type="text">
    </div>
    <div>
      <label>ingredient</label>
      <input v-model="post.ingredient" type="text">
    </div>
    <div>
      <label>procedure_1</label>
      <input v-model="post.procedure_1" type="text">
    </div>
    <div>
      <label>procedure_2</label>
      <input v-model="post.procedure_2" type="text">
    </div>
    <div>
      <label>procedure_3</label>
      <input v-model="post.procedure_3" type="text">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      post: {
        rname: '',
        rinformation: '',
        rimage: '',
        ingredient: '',
        procedure_1: '',
        procedure_2: '',
        procedure_3: ''
      },
      errors: ''
    }
  },
  methods: {
    createPost: function() {
      axios
        .post('/api/v1/posts', this.post)
        .then(response => {
          let e = response.data;
          this.$router.push('/');
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>
