Allonsy.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',

  author: function () {
    if (!this._author) {
      this._author = new Allonsy.Models.User();
    }
    return this._author;
  },

  like: function () {
    if (!this._like) { this._like = new Allonsy.Models.Like; }
    return this._like;
  },

  createLike: function () {
    this.like().set("post_id", this.id);
    this.like().save({}, {
      success: this.updateLikeCount.bind(this, 1)
    });
  },

  destroyLike: function () {
    this.like().destroy({
      success: function (model) {
        model.unset("id");
        this.updateLikeCount(-1);
      }.bind(this)
    });
  },

  toggleLike: function () {
    if (this.like().isNew()) {
      this.createLike();
    } else {
      this.destroyLike();
    }
  },

  updateLikeCount: function (delta) {
    this.set("num_likes", this.get("num_likes") + delta);
  },

  tags: function () {
    if (!this._tags) {
      this._tags = new Allonsy.Collections.Tags();
    }
    return this._tags;
  },

  parse: function (response) {
    this.like().set(response.like);
    delete response.like;

    this.author().set(response.author);
    delete response.author;

    this.tags().set(response.tags);
    delete response.tags;

    return response;
  },

  validate: function(attrs, options) {
    if (attrs.title.length === 0) {
      return "Title can't be blank";
    }
  }
});
