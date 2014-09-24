window.Allonsy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Allonsy.Router({ $rootEl: $('#main') });
    Backbone.history.start();
  }
};