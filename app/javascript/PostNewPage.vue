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
      <input type="file" name="rimage" @change="selectedFile">
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
    <table>
      <tbody>
        <tr>
          <th>Energy</th>
          <th>Protein</th>
          <th>Lipid</th>
          <th>Carbohydrate</th>
          <th>Dietary_fiber</th>
          <th>Potassium</th>
          <th>Calcium</th>
        </tr>
        <tr>
          <td><input v-model="post.Energy" type="number" step="0.01"></td>
          <td><input v-model="post.Protein" type="number" step="0.01"></td>
          <td><input v-model="post.Lipid" type="number" step="0.01"></td>
          <td><input v-model="post.Carbohydrate" type="number" step="0.01"></td>
          <td><input v-model="post.Dietary_fiber" type="number" step="0.01"></td>
          <td><input v-model="post.Potassium" type="number" step="0.01"></td>
          <td><input v-model="post.Calcium" type="number" step="0.01"></td>
        </tr>
      </tbody>
    </table>
    <table>
      <tbody>
        <tr>
          <th>iron</th>
          <th>Zinc</th>
          <th>VitaminA</th>
          <th>VitaminB1</th>
          <th>VitaminB2</th>
          <th>VitaminC</th>
          <th>Salt_equivalent</th>
        </tr>
        <tr>
          <td><input v-model="post.iron" type="number" step="0.01"></td>
          <td><input v-model="post.Zinc" type="number" step="0.01"></td>
          <td><input v-model="post.VitaminA" type="number" step="0.01"></td>
          <td><input v-model="post.VitaminB1"f type="number" step="0.01"></td>
          <td><input v-model="post.VitaminB2" type="number" step="0.01"></td>
          <td><input v-model="post.VitaminC" type="number" step="0.01"></td>
          <td><input v-model="post.Salt_equivalent" type="number" step="0.01"></td>
        </tr>
      </tbody>
    </table>
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
      errors: '',
      uploadFile: null
    }
  },
  methods: {
    selectedFile(e) {
      console.log(e.target.files[0])
      e.preventDefault();
      this.uploadFile = e.target.files[0]    // fileにはreadonly制約があり、v-modelは使えない。代わりにchangeイベントが推奨されている
    },
    createPost: function() {
      const data = new FormData();    // multipart/form-data形式のため、new FormData()を使う
      data.append('rname', this.post.rname);    // file形式以外も送信可能
      data.append('rinformation', this.post.rinformation);    // file形式以外も送信可能
      data.append('ingredient', this.post.ingredient);    // file形式以外も送信可能
      data.append('procedure_1', this.post.procedure_1);    // file形式以外も送信可能
      data.append('procedure_2', this.post.procedure_2);    // file形式以外も送信可能
      data.append('procedure_3', this.post.procedure_3);    // file形式以外も送信可能
      data.append('rimage', this.uploadFile);
      data.append('Energy', this.post.Energy);    // file形式以外も送信可能
      data.append('Protein', this.post.Protein);    // file形式以外も送信可能
      data.append('Lipid', this.post.Lipid);    // file形式以外も送信可能
      data.append('Carbohydrate', this.post.Carbohydrate);    // file形式以外も送信可能
      data.append('Dietary_fiber', this.post.Dietary_fiber);    // file形式以外も送信可能
      data.append('Potassium', this.post.Potassium);    // file形式以外も送信可能
      data.append('Calcium', this.post.Calcium);    // file形式以外も送信可能
      data.append('iron', this.post.iron);    // file形式以外も送信可能
      data.append('Zinc', this.post.Zinc);    // file形式以外も送信可能
      data.append('VitaminA', this.post.VitaminA);    // file形式以外も送信可能
      data.append('VitaminB1', this.post.VitaminB1);    // file形式以外も送信可能
      data.append('VitaminB2', this.post.VitaminB2);    // file形式以外も送信可能
      data.append('VitaminC', this.post.VitaminC);    // file形式以外も送信可能
      data.append('Salt_equivalent', this.post.VitaminC);    // file形式以外も送信可能
      axios
        .post('/api/v1/posts', data)
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
