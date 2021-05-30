
<template>
<div class="LikeListPage">

    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
  <h2>お気に入り</h2>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>rname</th>

        </tr>
        <tr v-for="e in posts" :key="e.id">
          <td>{{ e.id }}</td>
          <td>{{ e.rname }}</td>

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
      show: false ,
      q_0: '1',
      q_1: '1',
      q_2: '1',
      q_3: '1',
      q_4: '1',
      q_5: '1',
      q_6: '1',
      q_7: '1',
      q_8: '1',
      q_9: '1',
      q_10: '1',
      post: {
        rname: '',
        rinformation: '',
        rimage: '',
        ingredient: '',
        procedure_1: '',
        procedure_2: '',
        procedure_3: '',
        Energy: '',
        Protein: '',
        Lipid: '',
        Carbohydrate: '',
        Dietary_fiber: '',
        Potassium: '',
        Calcium: '',
        iron: '',
        Zinc: '',
        VitaminA: '',
        VitaminB1: '',
        VitaminB2: '',
        VitaminC: '',
        Salt_equivalent: ''       
      },
      sum_nutrients: {
        Energy: '',
        Protein: '',
        Lipid: '',
        Carbohydrate: '',
        Dietary_fiber: '',
        Potassium: '',
        Calcium: '',
        iron: '',
        Zinc: '',
        VitaminA: '',
        VitaminB1: '',
        VitaminB2: '',
        VitaminC: '',
        Salt_equivalent: ''       
      },
      posts: [],
      ingrd_sum: [],
      keyword: '',
      errors: '',
      uploadFile: null
      }
  },
  mounted () {
    axios
      .get(`/api/v1/likes/${this.$route.params.id}.json`)
      .then(response => (this.post = response.data))
  }
 
}
</script>
<style scoped>
</style>
