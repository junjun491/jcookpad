<template>
  <div id="app">

  <div>
    <h3>円グラフを描画する</h3>
    <PieChart :data="pieChartData" :options="options"></PieChart>
  </div>

    
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
import PieChart from './packs/components/chart/PieChart.vue'

export default {
  components: {
    PieChart
  },
  data: function () {
    return {
      posts: [],

      pieChartData : {
          // ラベル
        labels: ["天領", "薩摩", "長州", "土佐"],
          // データ詳細
        datasets: [{
              label: '藩と人口',
              data: [13740000, 9072000, 7150000, 6148000],
              backgroundColor: [
                 'rgba(255, 100, 130, 0.2)',
                 'rgba(100, 130, 255, 0.2)',
                 'rgba(130, 255, 100, 0.2)',
                 'rgba(230, 210, 85, 0.2)'
              ]
        }]
      },
      // グラフオプション
      options : {
          title: {
              display: true,
              text: '藩と人口'
          },
      }


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
