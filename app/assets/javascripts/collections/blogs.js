Allonsy.Collections.Blogs = Backbone.Collection.extend(
  _.extend({}, Allonsy.Mixins.PaginatableCollection, {
    url: '/api/blogs',

    model: Allonsy.Models.Blog,

    parse: function (response) {
      this.parsePage(response);
      return response.blogs;
    }
  }
));
