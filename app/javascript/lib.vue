<template>
  <div  >
    <div >
      <el-dialog 
      class="fizer"
      :visible.sync="dialogTableVisible"
      :lock-scroll = 'false'
      width="90%">
        <div class="frame" v-html="framevalue">2</div> 
      </el-dialog>
    </div>
    <div v-if="type == '1'">
      <draggable  v-model="katbib2s" class="dragArea" :options="{group: 'katbib2s'}"   @end="katbib2Moved">
        <div class="basetext cleared" v-for="(item, index)  in katbib2s">
          <div class="opad">
            <div>
              <h4>{{item.name}} 
                <el-button  v-on:click="destroy(index, item.id)" v-if="item.libraries.length == 0" size="mini" type="danger" icon="el-icon-delete" circle></el-button>
              </h4>
              <div class="hrline scale-in-hor-center  basetext" ></div>
            </div>
          </div>
          <draggable  v-model="item.libraries" :options="{group: 'libraries'}" @change="libraryMoved" >
            <transition-group name="list" appear>
              <div class="basetext grouplib " v-for="(library, index) in item.libraries" v-bind:key="library.created_at">
                <div class="itemrev "> 
                  <div class="libimg" :style="{backgroundImage: 'url('+ library.cover.thumb.url}"></div>
                  <div class="descbox">
                    <div>
                      <div><h4>{{library.name}}</h4> </div> 
                      <div v-html="library.desc"></div>  
                      <div class="buttonflexbox">
                        <div v-if="library.file.url.split('.')[1]=='doc' && readbutton == true">
                          <el-button v-on:click="frame(library.file.url)" class="libviewbut" size="small">Читать</el-button>
                        </div>
                        <div v-else>
                          <el-button  disabled class="libviewbut" size="small">Читать</el-button>
                        </div>
                        <a :href="library.file.url">
                          <el-button  class="libviewbut" size="small">скачать (.{{library.file.url.split(".")[1]}})</el-button>
                        </a>
                        <div style="color: #C1BDB3; position: relative;">
                          <div  style="position: absolute; bottom: 0.5em;"></div>
                        </div>
                      </div>
                    </div>
                  </div>     
                </div>
              </div> 
            </transition-group>
          </draggable>
        </div>
      </draggable> 
    </div>
    <div v-else>
      <div  v-model="katbib2s"  class="dragArea" >
        <div class="basetext cleared" v-for="(item, index)  in katbib2s">
          <div class="opad">
            <div>
              <h4>{{item.name}} 
                <el-button  v-on:click="destroy(index, item.id)" v-if="item.libraries.length == 0" size="mini" type="danger" icon="el-icon-delete" circle></el-button>
              </h4>
            <div class="hrline scale-in-hor-center  basetext" ></div>
          </div>
        </div>
        <div  v-model="item.libraries"  >
          <transition-group name="list" appear>
            <div class="basetext grouplib" v-for="(library, index) in item.libraries"  v-bind:key="library.created_at">
              <div class="itemrev"> 
                <div class="libimg" :style="{backgroundImage: 'url('+ library.cover.thumb.url}"></div>
                <div class="descbox">
                  <div>
                    <div><h4>{{library.name}}</h4> </div> 
                    <div v-html="library.desc"></div>  
                    <div class="buttonflexbox">
                      <div v-if="library.file.url.split('.')[1]=='doc' && readbutton == true">
                        <el-button v-on:click="frame(library.file.url)" class="libviewbut" size="small">Читать</el-button>
                      </div>
                      <div v-else>
                        <el-button  disabled class="libviewbut" size="small">Читать</el-button>
                      </div>
                      <a :href="library.file.url">
                        <el-button  class="libviewbut" size="small">Скачать</el-button>
                      </a>
                      <div style="color: #C1BDB3; position: relative;">
                        <div  style="position: absolute; bottom: 0.5em;">(.{{library.file.url.split(".")[1]}})</div>
                      </div>
                    </div>
                  </div>
                </div>     
              </div>
            </div>
          </transition-group> 
        </div>
      </div>
    </div>
  </div>
</div>
</template>
<script>
import axios from 'axios'
import draggable from "vuedraggable"

export default {
  components: { draggable },
  props: ["original_katbib2s", "original_type"],

  data: function () {
    return {
       // katbib2s: this.original_katbib2s,
    type: this.original_type,
    katbib2s: this.original_katbib2s, 
    framevalue: "",
    dialogTableVisible: false,
    readbutton: ''
    }
  },
  watch: {

  },
  methods: {
    frame: function(url1){
      this.dialogTableVisible = true;
      this.framevalue =  "<iframe src='https://view.officeapps.live.com/op/embed.aspx?src="+location.hostname+url1+"' width='100%' height='100%'   frameborder='0'></iframe>"
    },
    destroy: function(index, id){
      console.log('666')
       this.katbib2s.splice(index, 1)
       axios.delete('/katbib2s/'+ id)
      .then(response => {
         
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });   
    },
    libraryMoved: function(event) {
        const evt = event.added || event.moved
        if (evt == undefined) {return}
        const element = evt.element
        const katbib2_index = this.katbib2s.findIndex((katbib2) => {
          return katbib2.libraries.find((library) => {
            return library.id === element.id
          })
        })
        var data = new FormData
        data.append("library[katbib2_id]", this.katbib2s[katbib2_index].id)
        data.append("library[position]", evt.newIndex + 1)
        Rails.ajax({
          url: `/libraries/${element.id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json"
        })
      },
      katbib2Moved: function(event) {
        var data = new FormData
        data.append("katbib2[position]", event.newIndex + 1)
        Rails.ajax({
          url: `/katbib2s/${this.katbib2s[event.newIndex].id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },
    // fetchNews: function() {
    //   axios.get('/libraries')
    //   .then((response) => {
    //     this.libraries = response.data
    //     console.log(response.data);
         
    //   })
    //   .catch(function (error) {
    //     console.log(error);
    //   }); 
       
    // }
  },
  created() {
    // this.fetchNews();

  },
  mounted() {
     if (document.body.clientWidth > 800) {
      this.readbutton = true 
       
    }else{
      this.readbutton = false
      
    }
  },
  updated(){ 
    // $('.lostwidth').masonry({
    //   itemSelector: '.itemrev',
    //   columnWidth: '.itemrev',
    //   percentPosition: true
    // });
  },
  beforeUpdate() {
  }
} 

</script>

<style scoped>
@import "stylesheets/_variables";
.frame {
  overflow: hidden;
  height: 70vh;
}
.grouplib { 
  lost-column: 1/3 3 1em;
  text-align: left;
  @media (--only-medium-screen) {
    lost-column: 1/2 2 1em;
  }
  @media (--only-small-screen) {
    lost-column: 1/1;
  }
  @media (--only-xsmall-screen) {
    lost-column: 1/1;
  }
/*  lost-column: 1/1;*/
/*  lost-utility: clearfix;*/
 /* @media (--only-medium-screen) {
    lost-center: 1150px;
  }
  */
}
.list-item {
  text-align: center;
  display: inline-block;
  margin-right: 10px;
}
.list-enter-active, .list-leave-active {
  transition: all 1s;
}
.list-enter, .list-leave-to /* .list-leave-active до версии 2.1.8 */ {
  opacity: 0;
  transform: translateZ(30px);
}
.opad {
  display: flex;
  flex-direction: column;
  align-items: center; 
  padding: 0em 0 0.5em 0;
}
.descbox {  
  display: flex;
  align-content: center; 
  align-items: center;
  padding: 0.5em;
  h3 {
    margin-top: 0em;
  }
  h4 {
    color: #666;
  }
  p {
     margin-bottom: spacing(0);
  }
}
.buttonflexbox {
  display: flex;
  flex-direction: row;
}
.libviewbut {
   margin: 0.3em 0.5em;
}
.libimg { 
  border: 1px solid $x11gray;
  margin: 1em;
  height: 10em;
  width: 8em;
  background-position: center;
  background-size: cover; 
  background-repeat: no-repeat;
/*  background: #ada;*/
}
.itemrev{   
  display: flex;  
  /*lost-column: 1/3;
  text-align: justify;
   @media (--only-medium-screen) {
    lost-column: 1/2;
  }
  @media (--only-small-screen) {
    lost-column: 1/1;

  }
  @media (--only-xsmall-screen) {
    lost-column: 1/1;
  }*/
 /* 
  background: $floralwhite;*/
/*  border-left: 1px solid black;
  border-top: 1px solid black;
  border-bottom: 1px solid black;*/
 border-radius: 0.6em;
  background: radial-gradient(circle farthest-corner at 100px 50px, #ffffff, #F4F9FF);
  padding: 0.5 0.6em 0.5 ;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}
.knockout-around {
  position: relative; 
}
.knockout-around:before, .knockout-around:after {
  content: "";
  position: absolute;
}
.knockout-around:before {
  top: -3px;
  left: -3px;
  right: -3px;
  bottom: -3px;
  background-image: -webkit-gradient(radial, right top, 10, 90% 0%, 150, from(#000), to(transparent));
  background-image: -webkit-radial-gradient(right top, 150px 230px, #000, transparent);
  background-image: -moz-radial-gradient(right top, farthest-corner, #000 0%, transparent 72%);
  z-index: -2;
}
.knockout-around:after {
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background: #a4b9ff;
  z-index: -1;
}
.hrline {
  margin: 0.1em  0.1em 0em -0.2em;
}
.dragArea 
  {@media (--only-medium-screen) {
    lost-center: 1100px;
  }
  min-height: 20px;

} 
.lostwidth{
  /*lost-utility: clearfix;*/
   
  lost-masonry-wrap: no-flex;
 
}
 

.subj {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-style: italic; 
  font-weight: 300;
  color: color( $onyx  tint(10%));
  padding: 1em 1em 0em 1em;
  text-align: justify;
  @media (--only-xsmall-screen) {
    padding: 1em 0.5em 0em 0.5em;
  }

} 
.name {
  text-align: right;
  padding-right: 1em;
  margin-top: -1em;
  
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}  
</style>