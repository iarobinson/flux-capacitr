Allonsy.Models.Post = Backbone.Model.extend({
  urlRoot: 'api/posts',
  
  parse: function (response) {
    if (response.is_author) {
      this.set('is_author', response.is_author);
      delete response.is_author;
    }
    
    this.set('time_ago', response.time_ago);
    delete response.time_ago;
    
    this.set('url', response.url);
    delete response.url;
    
    return response;
  },
  
  validate: function(attrs, options) {
    if (attrs.title.length === 0) {
      return "Title can't be blank";
    }
  }
});