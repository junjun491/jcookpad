
<template>
<div class="LikeListPage">

    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
  <h2>お気に入り</h2>
  
  <p>計算結果</p>
<p>{{finalratio}}</p>

          <div class="col-xs-11 col-sm-6 col-md-6 col-lg-4">
    
            <!--
 <div><canvas id="myChart" class="chart-container" style="position: relative;  width:60vw; height:60vh"></div>

            -->

        <radar-chart :chart-data="datacollection" :options="options"></radar-chart>
          
          </div>



<p>選択したレシピの栄養合算</p>
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

<p>合算するレシピ</p>
<ul v-for="(item, index) in selectedPosts" v-bind:class="['q_' + index]" :key="item.id">
  <li>{{ item.rname }}</li><input v-model="$data['q_' + index]">

<p>Message is: {{ $data['q_' + index]}}</p>
</ul>

<div v-for="(post, i) in posts" :key="i">

  <label :for="'check_' + i">{{post.rname}}</label>
    <input
    :id="'check_' + i"
    type="checkbox"
    :value="post"
    v-model="selectedPosts"
  >
<img src="{{post.rimage}}"></div>





 
</div>
</template>
<script>
import RadarChart from "../RadarChart.js"; 


import axios from 'axios';
export default {
        components: {
            RadarChart,
        },
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
      std: {
        xEnergy: '',
        xProtein: '',
        xLipid: '',
        xCarbohydrate: '',
        xDietary_fiber: '',
        xPotassium: '',
        xCalcium: '',
        xiron: '',
        xZinc: '',
        xVitaminA: '',
        xVitaminB1: '',
        xVitaminB2: '',
        xVitaminC: '',
        xSalt_equivalent: ''       
      },
      pn_ratio: {
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
      },

      posts: [],
      selectedPosts: [],
      keyword: '',
      num1: '',
      errors: '',
      uploadFile: null,
                      fontColor: {
                    red: 'rgb(255, 99, 132,0.6)',
                    orange: 'rgb(255, 159, 64,0.6)',
                    yellow: 'rgb(255, 205, 86,0.6)',
                    green: 'rgb(75, 192, 192,0.6)',
                    blue: 'rgb(54, 162, 235,0.6)',
                    purple: 'rgb(153, 102, 255,0.6)',
                    grey: 'rgb(201, 203, 207,0.6)',
                },
                                datacollection: { labels:[], datasets: [] },
                                            options: {
              responsive: true,
              maintainAspectRatio: false,
              scale: {
                
                    Min: 0,
                    Max: 120
                
              }
            }

      }
  },
  created () {
            this.RadarChart()
  },
  watch: {
      chartData: {
        handler: function () {
          this.$data._chart.update()
        },
        deep: true
      }
  },
  computed: {
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
               for(let i in this.selectedPosts) {
                  console.log(`i: ${i}`)
                  console.log(`this.selectedPosts[i]: ${JSON.stringify(this.selectedPosts[i])}`)
                let ingrd = this.selectedPosts[i];
                  console.log(`ingrd: ${JSON.stringify(ingrd)}`)
                  console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`)
                  
        if (i == 0) {var bfr_num3 = this.q_0}
        else if (i == 1) {var bfr_num3 = this.q_1}
        else if (i == 2) {var bfr_num3 = this.q_2}
        else if (i == 3) {var bfr_num3 = this.q_3}
        else if (i == 4) {var bfr_num3 = this.q_4}
        else if (i == 5) {var bfr_num3 = this.q_5}
        else if (i == 6) {var bfr_num3 = this.q_6}
        else if (i == 7) {var bfr_num3 = this.q_7}
        else if (i == 8) {var bfr_num3 = this.q_8}
        else if (i == 9) {var bfr_num3 = this.q_9}
        else if (i == 10) {var bfr_num3 = this.q_10}
        else{var bfr_num3 = 1}                  
                  console.log(`bfr_num3: ${JSON.stringify(bfr_num3)}`)
                   for (let i = 0; i < 14; i++){
                     console.log(`sum_nutrients: ${JSON.stringify(sum_nutrients)}`)
                     console.log(`i: ${i}`)
                     let sn_key = sn_keys[i]
                     console.log(`sn_key: ${sn_key}`)
                     let num1 = parseFloat(sum_nutrients[sn_key])
                     let num2 = parseFloat(ingrd[sn_key])
                     let num3 = parseFloat(bfr_num3)
        if (Number.isNaN(num2)) {num2 = 0}
        if (num3 < 0 || 1000 < num3  ) {num3 = 1}
        else{
          num2 = num2 * num3
                               console.log(`num2x: ${JSON.stringify(num2)}`)
        }
                     console.log(`num1: ${JSON.stringify(num1)}`)
                     console.log(`num2: ${JSON.stringify(num2)}`)
                     sum_nutrients[sn_key] = num1 + num2;
                      console.log(`sum_nutrients[sn_key]: ${JSON.stringify(sum_nutrients[sn_key])}`)
                   }
                }
              return sum_nutrients;
    },
    finalratio: function () {
            return this.calcurate_ratio();
    }

  },
  mounted () {
    const url = location.pathname
    const id = url.replace(/[^0-9]/g, '');
    axios
      .get(`/api/v1/likes/${id}.json`)
      .then(response => (this.posts = response.data))
      console.log(`this.posts: ${JSON.stringify(this.posts)}`)
    axios
      .get(`/api/v1/likes.json`)
      .then(response => (this.std = response.data))
      console.log(`this.std: ${JSON.stringify(this.std)}`)
  },
  methods: {
RadarChart () {
                this.datacollection = {
              labels: ["エネルギー", "タンパク質", "脂質", "糖質", "食物繊維", "カリウム", "カルシウム", "鉄", "亜鉛", "ビタミンA", "ビタミンB1", "ビタミンB2", "ビタミンC", "食塩相当量"],
              datasets: [{
                label: '摂取基準',
                backgroundColor: "rgba(0,0,80,0.4)",
                borderColor: "rgba(0,0,80,1)",
                data: [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]
              }, {
                label: 'レシピの栄養比率',
                backgroundColor: "rgba(0,255,0,0.4)",
                borderColor: "rgba(0,255,0,1)",
                data: [this.finalratio.Energy, this.finalratio.Protein, this.finalratio.Lipid, this.finalratio.Carbohydrate, this.finalratio.Dietary_fiber, this.finalratio.Potassium, this.finalratio.Calcium, this.finalratio.iron, this.finalratio.Zinc, this.finalratio.VitaminA, this.finalratio.VitaminB1, this.finalratio.VitaminB2, this.finalratio.VitaminC, this.finalratio.Salt_equivalent]
              }]
                }
            },
calcurate_ratio: function() {
        var pn_ratio =  {
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
         var pn_keys = Object.keys(pn_ratio)

         console.log(`pn_ratio: ${JSON.stringify(pn_ratio)}`)
         console.log(`pn_keys: ${JSON.stringify(pn_keys)}`)
         console.log(`std: ${JSON.stringify(this.std)}`)

          for (var i = 0; i < 14; i++){
    
            var pn_key = pn_keys[i]
            var std_key = 'x' + pn_key
            console.log(`pn_key: ${pn_key}`)
            console.log(`std_key: ${std_key}`)
            console.log(`std: ${this.std}`)
            var num1 = parseFloat(this.addNutrients[pn_key])
            var num2 = parseFloat(this.std[std_key])
            console.log(`cnum1: ${JSON.stringify(num1)}`)
            console.log(`cnum2: ${JSON.stringify(num2)}`)
            pn_ratio[pn_key] = num1 / num2 * 100;
             console.log(`pn_ratio[pn_key]: ${JSON.stringify(pn_ratio[pn_key])}`)
    
    
            
            if (pn_ratio[pn_key] === null || pn_ratio[pn_key] < 0) {
              pn_ratio[pn_key] = 0
            }else if(pn_ratio[pn_key] > 150){
              pn_ratio[pn_key] = 150
            }
    
    
          }
          return pn_ratio

    },


  },
  
 
}
</script>
<style scoped>
</style>
