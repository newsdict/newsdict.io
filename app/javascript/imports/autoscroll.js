import Vue from 'vue'
import Axios from 'axios/dist/axios.js'
if (document.querySelector('#articles')) {
  var autoscroll = new Vue({
    el: "#articles",
    data: {
      current_page: 1,
      next_page: 2,
      is_scroll: false,
      contents: []
    },
    mounted() {
      window.addEventListener('scroll', this.handleScroll);
    },
    methods: {
      handleScroll() {
        // Max height of window
        const windowScrollMaxY = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        if (window.scrollY > windowScrollMaxY - 200) {
          if (this.is_scroll == false) {
            /* global URLSearchParams */
            const urlParams = new URLSearchParams(window.location.search);
            this.is_scroll = true
            const parser = document.createElement('a')
            parser.href = window.location
            Axios.get("/api/v1/contents.json",{
              params: {
                skip: this.current_page * 25,
                limit: 25,
                sort: urlParams.get('sort'),
                category: decodeURIComponent(parser.pathname.split('/')[2])
            }})
            .then(response => {
              this.contents = this.contents.concat(response.data)
              this.current_page++
              this.next_page++
              this.is_scroll = false
            })
          }
        }
      }
    }
  });
}