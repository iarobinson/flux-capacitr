Allonsy.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',
  
  parse: function (response) {
    if (response.is_author) {
      this.set('author', response.author);
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
      
      this.set('tags', response.tags);
      delete response.tags;
    }
    
    return response;
  },
  
  validate: function(attrs, options) {
    if (attrs.title.length === 0) {
      return "Title can't be blank";
    }
  }
});