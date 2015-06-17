window.Allonsy = {
  Mixins: {},
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Allonsy.Router({
      $rootEl: $("#content"),
      blogs: new Allonsy.Collections.Blogs()
    });
    Backbone.history.start();
  }
};

$(Allonsy.initialize());
