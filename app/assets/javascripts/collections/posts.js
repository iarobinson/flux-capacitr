Allonsy.Collections.Posts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  comparator: function (post) {
    return +new Date(post.get('created_at'));
  },
  
  initialize: function (options) {
    if (options) {
      this.blog = options.blog;      
    }
  }
});