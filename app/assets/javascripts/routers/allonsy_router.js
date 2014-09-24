Allonsy.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.$rootEl);
  },
  
  routes: {
    'blogs/:id': 'blogShow'
  },
  
  blogShow: function (id) {
    var blog = new Allonsy.Models.Blog({ id: id });
    blog.fetch();
    var view = new Allonsy.Views.BlogShow({ model: blog });
    this._swapView(view);
  },
  
  _swapView: function (newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});