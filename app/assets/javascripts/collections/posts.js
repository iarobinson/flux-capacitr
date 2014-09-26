Allonsy.Collections.Posts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  url: 'api/posts',
  
  parse: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
    return response.posts;
  }
});