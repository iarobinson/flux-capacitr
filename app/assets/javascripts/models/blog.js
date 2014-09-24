Allonsy.Models.Blog = Backbone.Model.extend({
  urlRoot: 'api/blogs',
  
  parse: function (response) {
    if (response.posts) {
      this.posts().set(response.posts, {parse: true});
      delete response.posts;
    }
    return response;
  },
  
  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts({
        blog: this
      });
    }
    return this._posts;
  }
});