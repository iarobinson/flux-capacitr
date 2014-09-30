Allonsy.SearchRouter = Allonsy.BaseRouter.extend({
  routes: {
    'search/:searchString': 'searchShow'
  },
  
  searchShow: function (searchString) {
    var search = new Allonsy.Models.Search({ searchString: searchString });
    var view = new Allonsy.Views.SearchShow({ model: search });
    this._swapView(view);
  }
});