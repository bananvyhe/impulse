<template>
  <div><el-dialog 
      class="fizer"
       
      :visible.sync="dialogTableVisible"
      :lock-scroll = 'false'
      width="90%">
        <div class="frame" v-html="framevalue">2</div> 
      </el-dialog>
  <draggable  v-model="katbib2s" class=" dragArea" :options="{group: 'katbib2s'}"   @end="katbib2Moved">
    <div>
      
    </div>
    
   
    <div class="basetext grouplib" v-for="(item, index)  in katbib2s">
      <div class="opad">
        <div>
          <h4>{{item.name}} 
              <el-button  v-on:click="destroy(index, item.id)" v-if="item.libraries.length == 0" size="mini" type="danger" icon="el-icon-delete" circle></el-button>
          </h4>
          <div class="hrline scale-in-hor-center  basetext" ></div>
        </div>
      </div>
       <draggable  v-model="item.libraries" :options="{group: 'libraries'}" @change="libraryMoved" class="cleared ">
      <transition-group name="list" appear>
        <div class="basetext" v-for="(library, index) in item.libraries" v-bind:key="library.created_at">
          <div class="itemrev">
            <div class="libimg" :style="{backgroundImage: 'url('+ library.cover.thumb.url}" >
            </div>
            <div class="descbox">
                   <!-- <iframe src='https://view.officeapps.live.com/op/embed.aspx?src=https://impuls-psy.ru/uploads/library/file/15/%D0%9F%D0%BE%D0%BB%D0%BE%D0%B2%D0%BE%D0%B5_%D0%B2%D0%BE%D1%81%D0%BF%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D0%B5_%D0%B4%D0%B5%D1%82%D0%B5%D0%B9_%D0%B8_%D0%BF%D0%BE%D0%B4%D1%80%D0%BE%D1%81%D1%82%D0%BA%D0%BE%D0%B2.docx' width='1366px' height='623px' frameborder='0'></iframe> -->
              <div>
                <div><h4>{{library.name}}</h4> </div> 
                <div v-html="library.desc"></div>  
                <div class="buttonflexbox">
                <!--  <a :href="library.file.url"> -->
                  <div v-if="library.file.url.split('.')[1]=='doc'">
                    <el-button v-on:click="frame(library.file.url)" class="libviewbut" size="small">Читать</el-button>
                  </div>
                  <div v-else>
                    <el-button  disabled class="libviewbut" size="small">Читать</el-button>
                  </div>
                  
                 
                <!-- </a> -->
                  <a :href="library.file.url">
                  <el-button  class="libviewbut" size="small">Скачать</el-button>
                  </a>
                   <p style="color: #C1BDB3; padding-top: 0.8em; ">(.{{library.file.url.split(".")[1]}})</p>
                </div>
              </div>
            </div>           
          </div>
        </div>
      </transition-group> 
      </draggable>
    </div>
    
     <!--  <div class="itemrev" v-for="(review, index) in reviews" v-bind:key="index" >         
          <div class="subj"><p>&laquo;{{review.subj}}&raquo;</p></div>
          <div class="name">{{review.name}}</div>        
      </div>
      -->

  </draggable>    
  </div>

</template>

<script>

 import axios from 'axios'
import draggable from "vuedraggable"

export default {
  components: { draggable },
  props: ["original_katbib2s"],

  data: function () {
    return {
       // katbib2s: this.original_katbib2s,
    katbib2s: this.original_katbib2s, 
    framevalue: "",
    dialogTableVisible: false
    }
  },
  watch: {

  },
  methods: {
    frame: function(url1){
      this.dialogTableVisible = true;
      this.framevalue =  "<iframe src='https://view.officeapps.live.com/op/embed.aspx?src=https://impuls-psy.ru"+url1+"' width='100%' height='100%'   frameborder='0'></iframe>"
      
      console.log(url1);

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
    
  },
  updated(){ 
    $('.lostwidth').masonry({
      itemSelector: '.itemrev',
      columnWidth: '.itemrev',
      percentPosition: true
    });
  },
  beforeUpdate() {
  }
} 

</script>

<style scoped>
@import "stylesheets/_variables";
.frame {
  background-color: #dad;
  overflow: hidden;
  height: 70vh;
}
.grouplib {
  padding-bottom: 1em;
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
  h3 {
    margin-top: 0em;
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
  lost-masonry-column: 1/3 18px;
  text-align: justify;
   @media (--only-medium-screen) {
    lost-masonry-column: 1/2 18px;
  }
  @media (--only-small-screen) {
    lost-masonry-column: 1/1;

  }
  @media (--only-xsmall-screen) {
    lost-masonry-column: 1/1;
  }
  background: $floralwhite;
  padding: 0.5 0.6em 0.5 ;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}
.hrline {
  margin: 0.1em  0.1em 0em -0.2em;
}
.dragArea {
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