Allonsy.Models.Feed = Backbone.Model.extend({
  posts: function () {
    if (!this._posts) {
      if (this.searchString) {
        this._posts = new Allonsy.Collections.Posts({
          searchString: this.searchString
        });
      } else {
        this._posts = new Allonsy.Collections.Posts();
      }
    }
    return this._posts;
  },
  
  initialize: function (options) {
    this.posts().fetch({
      remove: false,
      data: { page: 1 }
    });
    
    if (options && options.searchString) {
      this.searchString = searchString;
    }
  }
});