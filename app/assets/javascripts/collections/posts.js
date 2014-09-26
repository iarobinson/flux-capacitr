Allonsy.Collections.Posts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  initialize: function (options) {
    if (options.url) {
      this.url = options.url;
    }
  },
  
  parse: function (response) {
    return response.posts;
  }
});