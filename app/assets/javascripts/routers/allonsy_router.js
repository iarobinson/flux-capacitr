Allonsy.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.$rootEl);
  },
  
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
    var view = new Allonsy.Views.PostShow({ model: post });
    this._swapView(view);
  },
  
  _swapView: function (newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});