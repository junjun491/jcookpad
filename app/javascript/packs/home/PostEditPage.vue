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
      <h2>レシピ編集</h2>
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
          <input v-model="post.Energy" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾀﾝﾊﾟｸ質</label><br />
          <input v-model="post.Protein" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>脂質</label><br />
          <input v-model="post.Lipid" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>糖質</label><br />
          <input v-model="post.Carbohydrate" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>食物繊維</label><br />
          <input v-model="post.Dietary_fiber" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾘｳﾑ</label><br />
          <input v-model="post.Potassium" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ｶﾙｼｳﾑ</label><br />
          <input v-model="post.Calcium" type="number" step="0.01" />
        </div>

        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>鉄</label><br />
          <input v-model="post.iron" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>亜鉛</label><br />
          <input v-model="post.Zinc" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝa</label><br />
          <input v-model="post.VitaminA" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb1</label><br />
          <input v-model="post.VitaminB1" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝb2</label><br />
          <input v-model="post.VitaminB2" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>ﾋﾞﾀﾐﾝc</label><br />
          <input v-model="post.VitaminC" type="number" step="0.01" />
        </div>
        <div class="co-xs-2 col-sm-2 col-md-2 col-lg-2">
          <label>塩分相当量</label><br />
          <input v-model="post.Salt_equivalent" type="number" step="0.01" />
        </div>
      </div>
      <div v-show="show">
        <div>
          <button type="button" @click="Reflect_Nutrients(post)">
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
                <td>{{ addNutrients.Energy }}</td>
                <td>{{ addNutrients.Protein }}</td>
                <td>{{ addNutrients.Lipid }}</td>
                <td>{{ addNutrients.Carbohydrate }}</td>
                <td>{{ addNutrients.Dietary_fiber }}</td>
                <td>{{ addNutrients.Potassium }}</td>
                <td>{{ addNutrients.Calcium }}</td>
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
                <td>{{ addNutrients.iron }}</td>
                <td>{{ addNutrients.Zinc }}</td>
                <td>{{ addNutrients.VitaminA }}</td>
                <td>{{ addNutrients.VitaminB1 }}</td>
                <td>{{ addNutrients.VitaminB2 }}</td>
                <td>{{ addNutrients.VitaminC }}</td>
                <td>{{ addNutrients.Salt_equivalent }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div>
          <p>利用する材料</p>
          <ul
            v-for="(item, index) in ingrd_sum"
            v-bind:class="['q_' + index]"
            :key="item.id"
          >
            <li>{{ item.rname }}</li>
            <input v-model="$data['q_' + index]" />
          </ul>
        </div>
        <div>
          <input type="text" v-model="keyword" />
          <ul v-for="post in filteredPosts" :key="post.id">
            <li>{{ post.rname }}</li>
            <button type="button" @click="add_ingredient(post)">
              材料に追加
            </button>
          </ul>
        </div>
      </div>
      <button type="button" class="button" @click="show = !show">
        既存のレシピを材料に加える
      </button>
    </form>
    <button class="button" v-on:click.preventDefault="updatePost">
      Commit
    </button>
  </div>
</template>
<script>
import axios from "axios";
export default {
  data: function () {
    return {
      show: false,
      q_0: "1",
      q_1: "1",
      q_2: "1",
      q_3: "1",
      q_4: "1",
      q_5: "1",
      q_6: "1",
      q_7: "1",
      q_8: "1",
      q_9: "1",
      q_10: "1",
      post: {
        rname: "",
        rinformation: "",
        rimage: "",
        ingredient: "",
        procedure_1: "",
        procedure_2: "",
        procedure_3: "",
        Energy: "",
        Protein: "",
        Lipid: "",
        Carbohydrate: "",
        Dietary_fiber: "",
        Potassium: "",
        Calcium: "",
        iron: "",
        Zinc: "",
        VitaminA: "",
        VitaminB1: "",
        VitaminB2: "",
        VitaminC: "",
        Salt_equivalent: "",
      },
      sum_nutrients: {
        Energy: "",
        Protein: "",
        Lipid: "",
        Carbohydrate: "",
        Dietary_fiber: "",
        Potassium: "",
        Calcium: "",
        iron: "",
        Zinc: "",
        VitaminA: "",
        VitaminB1: "",
        VitaminB2: "",
        VitaminC: "",
        Salt_equivalent: "",
      },
      posts: [],
      ingrd_sum: [],
      keyword: "",
      errors: "",
      uploadFile: null,
    };
  },
  mounted() {
    const url = location.pathname;
    const id = url.replace(/[^0-9]/g, "");
    axios
      .get(`/api/v1/posts/${id}.json`)
      .then((response) => (this.post = response.data));
  },
  computed: {
    filteredPosts: function () {
      if (this.keyword === "") {
        return null;
      } else var posts = [];
      for (let i in this.posts) {
        console.log(`i: ${i}`);

        let post = this.posts[i];
        console.log(`post: ${JSON.stringify(post)}`);
        if (post.rname === null) {
        } else {
          if (post.rname.indexOf(this.keyword) !== -1) {
            posts.push(post);
          }
        }
      }
      return posts;
    },
    addNutrients: function () {
      let sum_nutrients = {
        Energy: "0",
        Protein: "0",
        Lipid: "0",
        Carbohydrate: "0",
        Dietary_fiber: "0",
        Potassium: "0",
        Calcium: "0",
        iron: "0",
        Zinc: "0",
        VitaminA: "0",
        VitaminB1: "0",
        VitaminB2: "0",
        VitaminC: "0",
        Salt_equivalent: "0",
      };
      let sn_keys = Object.keys(sum_nutrients);
      for (let i in this.ingrd_sum) {
        console.log(`i: ${i}`);
        console.log(`this.ingrd_sum[i]: ${JSON.stringify(this.ingrd_sum[i])}`);
        let ingrd = this.ingrd_sum[i];
        console.log(`ingrd: ${JSON.stringify(ingrd)}`);
        console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`);

        if (i == 0) {
          var bfr_num3 = this.q_0;
        } else if (i == 1) {
          var bfr_num3 = this.q_1;
        } else if (i == 2) {
          var bfr_num3 = this.q_2;
        } else if (i == 3) {
          var bfr_num3 = this.q_3;
        } else if (i == 4) {
          var bfr_num3 = this.q_4;
        } else if (i == 5) {
          var bfr_num3 = this.q_5;
        } else if (i == 6) {
          var bfr_num3 = this.q_6;
        } else if (i == 7) {
          var bfr_num3 = this.q_7;
        } else if (i == 8) {
          var bfr_num3 = this.q_8;
        } else if (i == 9) {
          var bfr_num3 = this.q_9;
        } else if (i == 10) {
          var bfr_num3 = this.q_10;
        } else {
          var bfr_num3 = 1;
        }
        console.log(`bfr_num3: ${JSON.stringify(bfr_num3)}`);
        for (let i = 0; i < 14; i++) {
          console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`);
          console.log(`i: ${i}`);
          let sn_key = sn_keys[i];
          console.log(`sn_key: ${sn_key}`);
          let num1 = parseFloat(sum_nutrients[sn_key]);
          let num2 = parseFloat(ingrd[sn_key]);
          let num3 = parseFloat(bfr_num3);
          if (Number.isNaN(num2)) {
            num2 = 0;
          }
          if (num3 < 0 || 1000 < num3) {
            num3 = 1;
          } else {
            num2 = num2 * num3;
            console.log(`num2x: ${JSON.stringify(num2)}`);
          }
          console.log(`num1: ${JSON.stringify(num1)}`);
          console.log(`num2: ${JSON.stringify(num2)}`);
          sum_nutrients[sn_key] = num1 + num2;
          console.log(
            `sum_nutrients[sn_key]: ${JSON.stringify(sum_nutrients[sn_key])}`
          );
        }
      }
      return sum_nutrients;
    },
  },
  methods: {
    selectedFile(e) {
      console.log(e.target.files[0]);
      e.preventDefault();
      this.uploadFile = e.target.files[0]; // fileにはreadonly制約があり、v-modelは使えない。代わりにchangeイベントが推奨されている
    },
    add_ingredient: function (post) {
      this.ingrd_sum.push(post);
    },
    Reflect_Nutrients: function (post) {
      console.log(`this.post.Energy: ${this.post.Energy}`);
      console.log(`this.sum_nutrients: ${JSON.stringify(this.sum_nutrients)}`);
      this.post.Energy = this.addNutrients.Energy;
      this.post.Protein = this.addNutrients.Protein;
      this.post.Lipid = this.addNutrients.Lipid;
      this.post.Carbohydrate = this.addNutrients.Carbohydrate;
      this.post.Dietary_fiber = this.addNutrients.Dietary_fiber;
      this.post.Potassium = this.addNutrients.Potassium;
      this.post.Calcium = this.addNutrients.Calcium;
      this.post.iron = this.addNutrients.iron;
      this.post.Zinc = this.addNutrients.Zinc;
      this.post.VitaminA = this.addNutrients.VitaminA;
      this.post.VitaminB1 = this.addNutrients.VitaminB1;
      this.post.VitaminB2 = this.addNutrients.VitaminB2;
      this.post.VitaminC = this.addNutrients.VitaminC;
      this.post.Salt_equivalent = this.addNutrients.Salt_equivalent;
    },
    updatePost: function () {
      const data = new FormData(); // multipart/form-data形式のため、new FormData()を使う
      data.append("rname", this.post.rname); // file形式以外も送信可能
      data.append("rinformation", this.post.rinformation); // file形式以外も送信可能
      data.append("ingredient", this.post.ingredient); // file形式以外も送信可能
      data.append("procedure_1", this.post.procedure_1); // file形式以外も送信可能
      data.append("procedure_2", this.post.procedure_2); // file形式以外も送信可能
      data.append("procedure_3", this.post.procedure_3); // file形式以外も送信可能
      data.append("rimage", this.uploadFile);
      data.append("Energy", this.post.Energy); // file形式以外も送信可能
      data.append("Protein", this.post.Protein); // file形式以外も送信可能
      data.append("Lipid", this.post.Lipid); // file形式以外も送信可能
      data.append("Carbohydrate", this.post.Carbohydrate); // file形式以外も送信可能
      data.append("Dietary_fiber", this.post.Dietary_fiber); // file形式以外も送信可能
      data.append("Potassium", this.post.Potassium); // file形式以外も送信可能
      data.append("Calcium", this.post.Calcium); // file形式以外も送信可能
      data.append("iron", this.post.iron); // file形式以外も送信可能
      data.append("Zinc", this.post.Zinc); // file形式以外も送信可能
      data.append("VitaminA", this.post.VitaminA); // file形式以外も送信可能
      data.append("VitaminB1", this.post.VitaminB1); // file形式以外も送信可能
      data.append("VitaminB2", this.post.VitaminB2); // file形式以外も送信可能
      data.append("VitaminC", this.post.VitaminC); // file形式以外も送信可能
      data.append("Salt_equivalent", this.post.VitaminC); // file形式以外も送信可能

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
