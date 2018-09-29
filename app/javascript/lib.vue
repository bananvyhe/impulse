<template>
  <draggable v-model="katbib2s" class=" dragArea" :options="{group: 'katbib2s'}"   @end="katbib2Moved">
    <div v-for="item in katbib2s">
      <h3>{{item.name}}</h3>
      <hr />
       <draggable  v-model="item.libraries" :options="{group: 'libraries'}" @change="libraryMoved">
      <div v-for="(library, index) in item.libraries">
        {{library.name}}
      </div>
      </draggable>
    </div>
     <!--  <div class="itemrev" v-for="(review, index) in reviews" v-bind:key="index" >         
          <div class="subj"><p>&laquo;{{review.subj}}&raquo;</p></div>
          <div class="name">{{review.name}}</div>        
      </div>
      -->
  </draggable>
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
    }
  },
  watch: {

  },
  methods: {
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
.dragArea {
  min-height: 20px;
} 
.lostwidth{
  /*lost-utility: clearfix;*/
   
  lost-masonry-wrap: no-flex;
 
}
.itemrev{
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
  padding: 0em 0.6em 1em;
  margin-top: 1em;
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