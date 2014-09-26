Allonsy.Collections.Posts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  url: 'api/posts',
  
  parse: function (response) {
    return response.posts;
  }
});