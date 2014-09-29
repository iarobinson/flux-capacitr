Allonsy.SearchRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.$rootEl);
    this.searchShow();
  },
  
  routes: {
    'search/:searchString': 'searchShow'
  },
  
  blogShow: function (id) {
    var blog = Allonsy.Collections.blogs.getOrFetch(id);
    var view = new Allonsy.Views.BlogShow({ model: blog });
    this._swapView(view);
  },
  
  feedShow: function () {
    var feed = new Allonsy.Models.Feed();
    var view = new Allonsy.Views.FeedShow({ model: feed });
    this._swapView(view);
  },
  
  postShow: function (id) {
    var post = new Allonsy.Models.Post({ id: id });
    var view = new Allonsy.Views.PostShow({ model: post });
    this._swapView(view);
  },
  
  searchShow: function (searchString) {
    var search = new Allonsy.Models.Search({ searchString: searchString });
    var view = new Allonsy.Views.SearchShow({ model: search });
    this._swapView(view);
  },
  
  _swapView: function (newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});