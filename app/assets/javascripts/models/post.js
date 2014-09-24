Allonsy.Models.Post = Backbone.Model.extend({
  validate: function(attrs, options) {
    if (attrs.title.length === 0) {
      return "Title can't be blank";
    }
  }
});