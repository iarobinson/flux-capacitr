// Models extending this module must have a `likableOptions` property pointing
// to an object with the like attributes: foreignKey (e.g., "post_id")

Allonsy.Mixins.Likable = {
  createLike: function () {
    this.like().set(this.likableOptions.foreignKey, this.id);
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

  like: function () {
    if (!this._like) { this._like = new Allonsy.Models.Like; }
    return this._like;
  },

  parseLike: function (response) {
    this.like().set(response.like);
    delete response.like;
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
  }
}
