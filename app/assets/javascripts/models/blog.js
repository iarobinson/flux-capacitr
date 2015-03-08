Allonsy.Models.Blog = Backbone.Model.extend({
  urlRoot: '/api/blogs',

  parse: function (response) {
    this.set('is_followed', response.is_followed);
    delete response.is_followed;

    this.set('show_controls', response.show_controls);
    delete response.show_controls;

    return response;
  },

  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts([], { blog: this });
    }
    return this._posts;
  }
});
