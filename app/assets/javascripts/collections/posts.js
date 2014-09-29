Allonsy.Collections.Posts = Backbone.Collection.extend({
  initialize: function (array, options) {
    if (options) {
      if (options.blog) {
        this.blog = options.blog;
      }
      if (options.searchString) {
        this.searchString = options.searchString;
      }
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
      return '/api/blogs/' + this.blog.get('id') + '/posts'
    } else if (this.searchString) {
      return '/api/posts/search/' + this.searchString;
    } else {
      return '/api/posts'
    }
  }
});