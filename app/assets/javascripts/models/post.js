Allonsy.Models.Post = Backbone.Model.extend({
  parse: function (response) {
    if (response.is_author) {
      this.set('is_author', response.is_author);
      delete response.is_author;
    }
    return response;
  },
  
  validate: function(attrs, options) {
    if (attrs.title.length === 0) {
      return "Title can't be blank";
    }
  }
});