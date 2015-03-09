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

    this.set('has_like_button', response.has_like_button);
    delete response.has_like_button;

    this.set('is_author', response.is_author);
    delete response.is_author;

    this.set('is_liked', response.is_liked);
    delete response.is_liked;

    this.set('blog_url', response.blog_url);
    delete response.blog_url;

    this.set('num_likes', response.num_likes);
    delete response.num_likes;

    this.set('time_ago', response.time_ago);
    delete response.time_ago;

    this.set('url', response.url);
    delete response.url;

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
