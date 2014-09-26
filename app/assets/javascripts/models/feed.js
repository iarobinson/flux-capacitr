Allonsy.Models.Feed = Backbone.Model.extend({
  url: 'api/posts',
  
  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts({ url: 'api/posts' });
    }
    return this._posts;
  },
  
  initialize: function () {
    this.posts().fetch();
  }
});