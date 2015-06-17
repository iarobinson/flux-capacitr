Allonsy.Collections.Blogs = Backbone.Collection.extend({
  url: 'api/blogs',

  model: Allonsy.Models.Blog,

  initialize: function (array, options) {
    if (options && options.searchString) {
      this.searchString = options.searchString;
    }
  },

  parse: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
    return response.blogs;
  },

  url: function () {
    if (this.searchString) {
      return '/api/blogs/search/' + this.searchString;
    } else {
      return '/api/blogs/search';
    }
  }
});
