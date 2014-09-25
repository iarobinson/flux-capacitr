Allonsy.Models.Feed = Backbone.Model.extend({
  url: 'api/feed',
  
  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts();
    }
    return this._posts;
  },
  
  initialize: function () {
    $.ajax('/api/feed', {
      success: function (response) {
        this.posts().set(response.posts);
      }.bind(this)
    });
  }
});