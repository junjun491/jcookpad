<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>rname</th>
          <th>rinformation</th>
          <th>rimage</th>
          <th>ingredient</th>
          <th>procedure_1</th>
          <th>procedure_2</th>
          <th>procedure_3</th>
        </tr>
        <tr v-for="e in posts" :key="e.id">
          <td>{{ e.id }}</td>
          <td>{{ e.rname }}</td>
          <td>{{ e.rinformation }}</td>
          <td>{{ e.rimage }}</td>
          <td>{{ e.ingredient }}</td>
          <td>{{ e.procedure_1 }}</td>
          <td>{{ e.procedure_2 }}</td>
          <td>{{ e.procedure_3 }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  data: function () {
    return {
      posts: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts= response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
