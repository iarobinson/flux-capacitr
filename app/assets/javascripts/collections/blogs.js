Allonsy.Collections.Blogs = Backbone.Collection.extend({
  url: '/api/blogs',

  model: Allonsy.Models.Blog,

  parse: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
    return response.blogs;
  }
});
