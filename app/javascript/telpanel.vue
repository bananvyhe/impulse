<template>
  <div id="telpanel">
    <h5>{{team.name}}</h5>

    <el-table v-if="team.players_attributes.length"
      :data = "team.players_attributes" style="width: 100%"
      >
      <el-table-column prop="name" label="Наименование услуги"></el-table-column>
      <el-table-column prop="graph" label="График занятий"></el-table-column>
      <el-table-column prop="group" label="Стоимость групповых занятий (за мес)"></el-table-column>
      <el-table-column prop="ind" label="Стоимость индивидуального занятия"></el-table-column>
    </el-table>

    <h4>Редактор:</h4>
    <div class="inputShort">
      <h5>Название категории:</h5>
      <el-input  placeholder="Название категории" type="text" v-model="team.name" /></el-input>
    </div>

    <div v-for="(player, index) in team.players_attributes">
      <div v-if="player._destroy == '1'" class="delMessage"> Строка "{{ player.name }}" &ndash;  удалена.  <button class="button is-small is-info is-inverted" v-on:click="undoRemove(index)">Восстановить</button>
       
      </div>
      <div v-else>
        <el-form>
          <el-form-item>
            <el-col :span="5">
              <el-input v-model="player.name" placeholder="Наименование услуги"></el-input>
            </el-col>
            <el-col :span="5">
              <el-input v-model="player.graph" placeholder="График занятий"></el-input>
            </el-col>
            <el-col :span="5">
              <el-input v-model="player.group" placeholder="Стоимость групповых занятий (за мес)"></el-input>    
            </el-col>
            <el-col :span="5">
              <el-input v-model="player.ind" placeholder="Стоимость индивидуального занятия"></el-input> 
            </el-col>
            <el-col :span="3">
              <el-button   type="danger" plain v-on:click="removePlayer(index)">Удалить
              </el-button> 
            </el-col>
          </el-form-item>
        </el-form>
      </div>
    </div>
    <el-button v-on:click="addPlayer" type="primary" plain>
      Добавить позицию
    </el-button> 
    <el-button v-on:click="saveTeam" type="success" plain>
      Сохранить
    </el-button> 
  </div>
</template>
<script>
// setTimeout(function(){
//       $('.tel').css('visibility', 'visible').addClass('slideUpReturn');
// }, 1300);
import axios from 'axios'
var element = document.getElementById("team-form")
if (element != null) {
  console.log(element);
  var id = element.dataset.id
  var team = JSON.parse(element.dataset.team)
  var players_attributes = JSON.parse(element.dataset.playersAttributes)
  players_attributes.forEach(function(player) { player._destroy = null })
  team.players_attributes = players_attributes 
}
export default {
  data: function () {
    return {
      id: id, 
      team: team, 
      postBody: '',
      errors: [],
    }
  },
  created() {
  	axios.get('/teams')
	  .then(function (response) {
	    console.log(response);
	  })
	  .catch(function (error) {
	    console.log(error);
	  });	
  },
  mounted() {
  },
  updated() {
  },
  methods: {
    addPlayer: function() {
      this.team.players_attributes.push({
        id: null,
        name: "",
        graph: "",
        group: "",
        ind: "",
        //position: " ",
        _destroy: null
      })
      console.log(this.team.players_attributes)
      console.log(this.team)
    },
    removePlayer: function(index) {
      var player = this.team.players_attributes[index]
      if (player.id == null) {
        this.team.players_attributes.splice(index, 1)
      } else {
        this.team.players_attributes[index]._destroy = "1"
      }
      console.log(this.team.players_attributes)
      console.log(this.team)
    },
    undoRemove: function(index) {
      this.team.players_attributes[index]._destroy = null
    },
    saveTeam: function() {
      // Create a new team
      if (this.id == null) {
        axios.post('/teams', { team: this.team }).then(response => {
         window.location.href = '/teams' ; 
        }, response => {
          console.log(response)
        })
      // Edit an existing team
      } else {
        axios.put(`/teams/${this.id}`, { team: this.team }).then(response => {
           window.location.href = '/teams';  
        }, response => {
          console.log(response)
        })
      }
    },
    existingTeam: function() {
      return this.team.id != null
    },
  }
}
</script>

<style scoped>

</style>