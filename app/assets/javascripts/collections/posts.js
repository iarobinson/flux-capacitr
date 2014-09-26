Allonsy.Collections.Posts = Backbone.Collection.extend({
  initialize: function (array, options) {
    if (options && options.blog) {
      this.blog = options.blog;
    }
  },
  
  model: Allonsy.Models.Post,
  
  parse: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
    return response.posts;
  },
  
  url: function () {
    if (this.blog) {
      return 'api/blogs/' + this.blog.get('id') + '/posts'
    } else {
      return 'api/posts'
    }
  }
});