Allonsy.Models.Blog = Backbone.Model.extend(
  _.extend({}, Allonsy.Mixins.Followable, {
    urlRoot: '/api/blogs',

    followableOptions: {
      foreignKey: "blog_id"
    },

    parse: function (response) {
      this.parseFollowing(response);
      return response;
    },

    posts: function () {
      if (!this._posts) {
        this._posts = new Allonsy.Collections.Posts([], { blog: this });
      }
      return this._posts;
    }
  }
));
