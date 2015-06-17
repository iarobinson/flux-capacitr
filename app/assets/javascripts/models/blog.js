Allonsy.Models.Blog = Backbone.Model.extend({
  urlRoot: '/api/blogs',

  parse: function (response) {
    return response;
  },

  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts([], { blog: this });
    }
    return this._posts;
  }
});
