Allonsy.SearchRouter = Backbone.Router.extend(
  _.extend({}, Allonsy.Mixins.SwappingRouter, {
    routes: {
      'search/:searchString': 'searchShow'
    },

    searchShow: function (searchString) {
      var search = new Allonsy.Models.Search({ searchString: searchString });
      var view = new Allonsy.Views.SearchShow({ model: search });
      this._swapView(view);
    }
  })
);
