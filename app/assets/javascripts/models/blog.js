Allonsy.Models.Blog = Backbone.Model.extend({
  urlRoot: '/api/blogs',

  following: function () {
    if (!this._following) { this._following = new Allonsy.Models.Following; }
    return this._following;
  },

  createFollowing: function () {
    this.following().set("blog_id", this.id);
    this.following().save();
  },

  destroyFollowing: function () {
    this.following().destroy({
      success: function (model) {
        model.unset("id");
      }.bind(this)
    });
  },

  toggleFollowing: function () {
    if (this.following().isNew()) {
      this.createFollowing();
    } else {
      this.destroyFollowing();
    }
  },

  parse: function (response) {
    this.following().set(response.following);
    delete response.following;

    return response;
  },

  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts([], { blog: this });
    }
    return this._posts;
  }
});
