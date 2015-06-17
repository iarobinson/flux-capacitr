Allonsy.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',

  author: function () {
    if (!this._author) {
      this._author = new Allonsy.Models.User();
    }
    return this._author;
  },

  tags: function () {
    if (!this._tags) {
      this._tags = new Allonsy.Collections.Tags();
    }
    return this._tags;
  },

  parse: function (response) {
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
