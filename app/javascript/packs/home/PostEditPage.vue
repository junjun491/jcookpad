<template>
  <div class="PostEditPage">
    <form>
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li>
            <font color="red">{{ e }}</font>
          </li>
        </ul>
      </div>
      <h2>レシピ編集test</h2>

      <div>
        <label>レシピ名</label><br />
        <input v-model="post.rname" type="text" />
      </div>
      <div>
        <label>レシピ情報</label><br />

        <textarea v-model="post.rinformation"></textarea>
      </div>
      <div>
        <label>レシピイメージ</label><br />
        <input type="file" name="rimage" @change="selectedFile" />
      </div>
      <div>
        <label>材料</label><br />

        <textarea v-model="post.ingredient"></textarea>
      </div>
      <div>
        <label>手順１</label><br />

        <textarea v-model="post.procedure_1"></textarea>
      </div>
      <div>
        <label>手順２</label><br />

        <textarea v-model="post.procedure_2"></textarea>
      </div>
      <div>
        <label>手順３</label><br />

        <textarea v-model="post.procedure_3"></textarea>
      </div>

      <div class="form-row">
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｴﾈﾙｷﾞｰ</label><br />
          <input v-model="post.Energy" type="number" step="0.01" />kcal
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾀﾝﾊﾟｸ質</label><br />
          <input v-model="post.Protein" type="number" step="0.01" />g
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>脂質</label><br />
          <input v-model="post.Lipid" type="number" step="0.01" />g
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>糖質</label><br />
          <input v-model="post.Carbohydrate" type="number" step="0.01" />g
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>食物繊維</label><br />
          <input v-model="post.Dietary_fiber" type="number" step="0.01" />g
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾘｳﾑ</label><br />
          <input v-model="post.Potassium" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾙｼｳﾑ</label><br />
          <input v-model="post.Calcium" type="number" step="0.01" />mg
        </div>

        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>鉄</label><br />
          <input v-model="post.iron" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>亜鉛</label><br />
          <input v-model="post.Zinc" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝa</label><br />
          <input v-model="post.VitaminA" type="number" step="0.01" />μg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb1</label><br />
          <input v-model="post.VitaminB1" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb2</label><br />
          <input v-model="post.VitaminB2" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝc</label><br />
          <input v-model="post.VitaminC" type="number" step="0.01" />mg
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>塩分相当量</label><br />
          <input v-model="post.Salt_equivalent" type="number" step="0.01" />g
        </div>
      </div>
      <div v-show="show">
        <div>
          <button class="button" type="button" @click="Reflect_Nutrients(post)">
            材料を反映
          </button>
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
                <td>{{ addNutrients.Energy }}kcal</td>
                <td>{{ addNutrients.Protein }}g</td>
                <td>{{ addNutrients.Lipid }}g</td>
                <td>{{ addNutrients.Carbohydrate }}g</td>
                <td>{{ addNutrients.Dietary_fiber }}g</td>
                <td>{{ addNutrients.Potassium }}mg</td>
                <td>{{ addNutrients.Calcium }}mg</td>
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
                <td>{{ addNutrients.iron }}mg</td>
                <td>{{ addNutrients.Zinc }}mg</td>
                <td>{{ addNutrients.VitaminA }}μg</td>
                <td>{{ addNutrients.VitaminB1 }}mg</td>
                <td>{{ addNutrients.VitaminB2 }}mg</td>
                <td>{{ addNutrients.VitaminC }}mg</td>
                <td>{{ addNutrients.Salt_equivalent }}g</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div>
          <p>利用する材料</p>
          <ul v-for="ingredient in allIngredients" :key="ingredient.id">
            <li>{{ ingredient.rname }}</li>

            <input v-model="ingredient.quantity" />
          </ul>
        </div>
        <div>
          <input type="text" v-model="keyword" />
          <button class="button" type="button" @click="filteredPosts">
            検索
          </button>
          <ul v-for="post in posts" :key="post.id">
            <li>{{ post.rname }}</li>
            <button class="button" type="button" @click="add_ingredient(post)">
              材料に追加
            </button>
          </ul>
        </div>
      </div>
      <button type="button" class="button" @click="show = !show">
        既存のレシピを材料に加える
      </button>
    </form>
    <br />
    <button class="button" v-on:click.preventDefault="updatePost">
      Commit
    </button>
  </div>
</template>
<script>
import Nutrients from "./nutrientsClass.js";
import postParameters from "./postParameters.js";
import axios from "axios";
export default {
  data: function () {
    return {
      show: false,
      post: {},
      posts: [],
      allIngredients: [],
      keyword: "",
      errors: "",
      uploadFile: null,
    };
  },
  mounted() {
    const url = location.pathname;
    const id = url.replace(/[^0-9]/g, "");
    console.log(`this.post_before_mounted: ${JSON.stringify(this.post)}`);
    axios
      .get(`/api/v1/posts/${id}.json`)
      .then(
        (response) => (
          (this.post = response.data),
          console.log(`this.post_mounted: ${JSON.stringify(this.post)}`)
        )
      );
  },
  computed: {
    addNutrients: function () {
      let totalNutrients = new Nutrients();
      for (let i in this.allIngredients) {
        for (let j = 0; j < 14; j++) {
          let oneOfNutrientsName = totalNutrients.keyname()[j];

          totalNutrients[oneOfNutrientsName] =
            Number(totalNutrients[oneOfNutrientsName]) +
            Number(this.allIngredients[i][oneOfNutrientsName]) *
              Number(this.allIngredients[i].quantity);
        }
      }
      return totalNutrients;
    },
  },
  methods: {
    selectedFile(e) {
      e.preventDefault();
      this.uploadFile = e.target.files[0]; // fileにはreadonly制約があり、v-modelは使えない。代わりにchangeイベントが推奨されている
    },
    add_ingredient: function (post) {
      this.allIngredients.splice(-1, 0, post);
    },
    Reflect_Nutrients: function (post) {
      for (let i = 0; i < 14; i++) {
        let sampleNutrients = new Nutrients();
        let oneOfNutrientsName = sampleNutrients.keyname()[i];
        this.post[oneOfNutrientsName] = this.addNutrients[oneOfNutrientsName];
      }
    },
    filteredPosts: function (keyword) {
      if (this.keyword === "") {
        posts = null;
      } else
        axios
          .get("/api/v1/posts/refer/" + this.keyword)
          .then((response) => (this.posts = response.data));
    },
    updatePost: function () {
      const data = new FormData(); // multipart/form-data形式のため、new FormData()を使う
      for (const i of postParameters) {
        data.append(i, this.post[i]); // file形式以外も送信可能
      }
      const url = location.pathname;
      const id = url.replace(/[^0-9]/g, "");
      axios
        .patch(`/api/v1/posts/${id}`, data)
        .then((response) => {
          let e = response.data;
          window.location = `/posts/${id}`;
        })
        .catch((error) => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
  },
};
</script>
