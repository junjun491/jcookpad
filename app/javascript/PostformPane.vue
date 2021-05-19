<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>レシピ名</label><br>
      <input v-model="post.rname" type="text">
    </div>
    <div>
      <label>レシピ情報</label><br>


  <textarea v-model="post.rinformation"></textarea>
    </div>
    <div>
      <label>レシピイメージ</label><br>
      <input type="file" name="rimage" @change="selectedFile">
    </div>
    <div>
      <label>材料</label><br>


  <textarea v-model="post.ingredient"></textarea>


    </div>
    <div>
      <label>手順１</label><br>


  <textarea v-model="post.procedure_1"></textarea>


    </div>
    <div>
      <label>手順２</label><br>


  <textarea v-model="post.procedure_2"></textarea>

    </div>
    <div>
      <label>手順３</label><br>

  <textarea v-model="post.procedure_3"></textarea>


    </div>
 
        <div class="form-row">
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｴﾈﾙｷﾞｰ</label><br>
          <input v-model="post.Energy" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾀﾝﾊﾟｸ質</label><br>
          <input v-model="post.Protein" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>脂質</label><br>
          <input v-model="post.Lipid" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>糖質</label><br>
          <input v-model="post.Carbohydrate" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>食物繊維</label><br>
          <input v-model="post.Dietary_fiber" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾘｳﾑ</label><br>
          <input v-model="post.Potassium" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾙｼｳﾑ</label><br>
          <input v-model="post.Calcium" type="number" step="0.01">
    </div>

    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>鉄</label><br>
          <input v-model="post.iron" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>亜鉛</label><br>
          <input v-model="post.Zinc" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝa</label><br>
          <input v-model="post.VitaminA" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb1</label><br>
          <input v-model="post.VitaminB1" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb2</label><br>
          <input v-model="post.VitaminB2" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝc</label><br>
          <input v-model="post.VitaminC" type="number" step="0.01">
    </div>
    <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>塩分相当量</label><br>
          <input v-model="post.Salt_equivalent" type="number" step="0.01">
    </div>
        </div>
    <div v-show="show">
    <div>
<button type="button" @click="Reflect_Nutrients(post)">材料を反映</button>
<p>利用する材料の栄養合算</p>
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">ｴﾈﾙｷﾞｰ</th>
      <th scope="col">ﾀﾝﾊﾟｸ質</th>
      <th scope="col">脂質</th>
      <th scope="col">糖質</th>
      <th scope="col">食物繊維</th>
      <th scope="col">ｶﾘｳﾑ</th>
      <th scope="col">ｶﾙｼｳﾑ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{addNutrients.Energy}}</td>
      <td>{{addNutrients.Protein}}</td>
      <td>{{addNutrients.Lipid}}</td>
      <td>{{addNutrients.Carbohydrate}}</td>
      <td>{{addNutrients.Dietary_fiber}}</td>
      <td>{{addNutrients.Potassium}}</td>
      <td>{{addNutrients.Calcium}}</td>
    </tr>
  </tbody>
</table>
<table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">鉄</th>
      <th scope="col">亜鉛</th>
      <th scope="col">ﾋﾞﾀﾐﾝa</th>
      <th scope="col">ﾋﾞﾀﾐﾝb1</th>
      <th scope="col">ﾋﾞﾀﾐﾝb2</th>
      <th scope="col">ﾋﾞﾀﾐﾝc</th>
      <th scope="col">塩分相当量</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      
      <td>{{addNutrients.iron}}</td>
      <td>{{addNutrients.Zinc}}</td>
      <td>{{addNutrients.VitaminA}}</td>
      <td>{{addNutrients.VitaminB1}}</td>
      <td>{{addNutrients.VitaminB2}}</td>
      <td>{{addNutrients.VitaminC}}</td>
      <td>{{addNutrients.Salt_equivalent}}</td>
    </tr>
  </tbody>
</table>


    </div>
    <div>
<p>利用する材料</p>
<ul v-for="(item, index) in ingrd_sum" v-bind:class="['q_' + index]" :key="item.id">
  <li>{{ item.rname }}</li><input v-model="$data['q_' + index]">
  <p>{{ index }}</p>
<p>Message is: {{ $data['q_' + index]}}</p>
</ul>
    </div>
    <div>
      <input type="text" v-model="keyword">
      <ul v-for="post in filteredPosts" :key="post.id">
        <li>{{ post.rname }}</li><button type="button" @click="add_ingredient(post)">材料に追加</button>
      </ul>
    </div>
    </div>
    <button type="button" @click="show=!show">既存のレシピを材料に加える</button>
    <button type="submit">Commit</button>
  </form>
</template>
<script>
export default {
  props: {
      show: '',
      q_0: '',
      q_1: '',
      q_2: '',
      q_3: '',
      q_4: '',
      q_5: '',
      q_6: '',
      q_7: '',
      q_8: '',
      q_9: '',
      q_10: '',
      post: {},
      sum_nutrients: {},
      posts: [],
      ingrd_sum: [],
      keyword: '',
      errors: '',
      uploadFile: ''
      }
  }

</script>

<style>
</style>