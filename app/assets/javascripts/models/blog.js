Allonsy.Models.Blog = Backbone.Model.extend({
  urlRoot: 'api/blogs',

  parse: function (response) {
    if (response.posts) {
      this.posts().set(response, {parse: true});
      delete response.posts;
      
      this.set('is_followed', response.is_followed);
      delete response.is_followed;
    }
    return response;
  },

  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts();
    }
    return this._posts;
  }
});