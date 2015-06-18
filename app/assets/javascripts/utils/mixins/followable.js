// Models extending this module must have a `followableOptions` property
// pointing to an object with the following attributes: foreignKey (e.g.,
// "blog_id")

Allonsy.Mixins.Followable = {
  following: function () {
    if (!this._following) { this._following = new Allonsy.Models.Following; }
    return this._following;
  },

  createFollowing: function () {
    this.following().set(this.followableOptions.foreignKey, this.id);
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

  parseFollowing: function (response) {
    this.following().set(response.following);
    delete response.following;
  }
}
