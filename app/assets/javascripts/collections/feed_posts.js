Allonsy.Collections.FeedPosts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  url: 'api/posts',
  
  initialize: function () {
    this.fetch();
  },
  
  parse: function (response) {
    return response.posts;
  }
});