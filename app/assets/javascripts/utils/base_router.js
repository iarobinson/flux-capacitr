Allonsy.BaseRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = $(options.$rootEl);
  },
  
  _swapView: function (newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});