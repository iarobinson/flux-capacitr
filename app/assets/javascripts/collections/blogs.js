Allonsy.Collections.Blogs = Backbone.Collection.extend({
  getOrFetch: function (id) {
    var blogs = this;

    var blog = this.get(id);
    if (!blog) {
      blog = new Allonsy.Models.Blog({ id: id });
      blog.fetch({
        success: function () { blogs.add(blog); }
      });
    }

    return blog;
  },

  initialize: function (array, options) {
    if (options && options.searchString) {
      this.searchString = options.searchString;
    }
  },

  model: Allonsy.Models.Blog,

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
