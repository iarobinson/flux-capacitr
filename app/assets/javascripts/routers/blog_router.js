Allonsy.BlogRouter = Allonsy.BaseRouter.extend({
  routes: {
    'blogs/:id': 'blogShow',
    'posts/:id': 'postShow'
  },
  
  blogShow: function (id) {
    var blog = Allonsy.Collections.blogs.getOrFetch(id);
    var view = new Allonsy.Views.BlogShow({ model: blog });
    this._swapView(view);
  },
  
  postShow: function (id) {
    var post = new Allonsy.Models.Post({ id: id });
    var router = this;
    
    post.fetch({
      success: function (response) {
        var view = new Allonsy.Views.PostShow({
          model: post,
          displayAvatar: true
        });
      
        router._swapView(view);
      }
    });
  }
});