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
          <td><input v-model="post.VitaminB1" type="number" step="0.01"></td>
          <td><input v-model="post.VitaminB2" type="number" step="0.01"></td>
          <td><input v-model="post.VitaminC" type="number" step="0.01"></td>
          <td><input v-model="post.Salt_equivalent" type="number" step="0.01"></td>
        </tr>
      </tbody>
    </table>
    <div>
<p>利用する材料の栄養合算</p>
<p>{{addNutrients}}</p>
<button type="button" @click="Reflect_Nutrients(post)">材料を反映</button>
    </div>
    <div>
<p>利用する材料</p>
<li v-for="item in ingrd_sum" :key="item.rname">
  {{ item.rname }}
</li>
    </div>
    <div>
      <input type="text" v-model="keyword">
      <ul v-for="post in filteredPosts" :key="post.id">
        <li>{{ post.rname }}</li><button type="button" @click="add_ingredient(post)">材料に追加</button>
      </ul>
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

  computed: {
            filteredPosts: function() {
                if(this.keyword === "")
                  {return null}
                else
                var posts = [];
                for(let i in this.posts) {
                    let post = this.posts[i];
                    if(post.rname.indexOf(this.keyword) !== -1)
                     {posts.push(post);}
                }
              return posts;
            },
            addNutrients: function() {
               let sum_nutrients = {
                Energy: '0',
                Protein: '0',
                Lipid: '0',
                Carbohydrate: '0',
                Dietary_fiber: '0',
                Potassium: '0',
                Calcium: '0',
                iron: '0',
                Zinc: '0',
                VitaminA: '0',
                VitaminB1: '0',
                VitaminB2: '0',
                VitaminC: '0',
                Salt_equivalent: '0'       
               };
                console.log(`sum_nutrients: ${sum_nutrients}`)
                let sn_keys = Object.keys(sum_nutrients)
                console.log(`sn_keys: ${sn_keys}`)
               for(let i in this.ingrd_sum) {
                  console.log(`i: ${i}`)
                  console.log(`this.ingrd_sum[i]: ${JSON.stringify(this.ingrd_sum[i])}`)
                let ingrd = this.ingrd_sum[i];
                  console.log(`ingrd: ${JSON.stringify(ingrd)}`)
                  console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`)
                  
                   for (let i = 0; i < 14; i++){
                     console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`)
                     console.log(`i: ${i}`)
                     let sn_key = sn_keys[i]
                     console.log(`sn_key: ${sn_key}`)
                     let num1 = parseFloat(sum_nutrients[sn_key])
                     let num2 = parseFloat(ingrd[sn_key])
                     console.log(`num1: ${JSON.stringify(num1)}`)
                     console.log(`num2: ${JSON.stringify(num2)}`)
                     sum_nutrients[sn_key] = num1 + num2;
                      console.log(`sum_nutrients[sn_key]: ${JSON.stringify(sum_nutrients[sn_key])}`)
                   }
                }
              return sum_nutrients;
            },
            
  },








 mounted () {
    axios
      .get('/api/v1/posts.json')
      .then(response => (this.posts= response.data))
  },


  methods: {
    selectedFile(e) {
      console.log(e.target.files[0])
      e.preventDefault();
      this.uploadFile = e.target.files[0]    // fileにはreadonly制約があり、v-modelは使えない。代わりにchangeイベントが推奨されている
    },
    add_ingredient: function(post) {
      this.ingrd_sum.push(post);
    },
    Reflect_Nutrients: function(post) {
      console.log(`this.post.Energy: ${this.post.Energy}`)
      console.log(`this.sum_nutrients: ${JSON.stringify(this.sum_nutrients)}`)
      this.post.Energy = this.addNutrients.Energy
      this.post.Protein = this.addNutrients.Protein
      this.post.Lipid = this.addNutrients.Lipid
      this.post.Carbohydrate = this.addNutrients.Carbohydrate
      this.post.Dietary_fiber = this.addNutrients.Dietary_fiber
      this.post.Potassium = this.addNutrients.Potassium
      this.post.Calcium = this.addNutrients.Calcium
      this.post.iron = this.addNutrients.iron
      this.post.Zinc = this.addNutrients.Zinc
      this.post.VitaminA = this.addNutrients.VitaminA
      this.post.VitaminB1 = this.addNutrients.VitaminB1
      this.post.VitaminB2 = this.addNutrients.VitaminB2
      this.post.VitaminC = this.addNutrients.VitaminC
      this.post.Salt_equivalent = this.addNutrients.Salt_equivalent
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
