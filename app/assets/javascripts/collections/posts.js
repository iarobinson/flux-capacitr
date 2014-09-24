Allonsy.Collections.Posts = Backbone.Collection.extend({
  model: Allonsy.Models.Post,
  
  initialize: function (options) {
    if (options) {
      this.blog = options.blog;      
    }
  }
});