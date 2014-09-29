Allonsy.SearchRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.$rootEl);
  },
  
  routes: {
    'search/:searchString': 'searchShow'
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