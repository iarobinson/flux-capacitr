Allonsy.Models.Search = Backbone.Model.extend({
  posts: function () {
    if (!this._posts) {
      this._posts = new Allonsy.Collections.Posts([], {
        searchString: this.searchString
      });
    }
    return this._posts;
  },
  
  blogs: function () {
    if (!this._blogs) {
      this._blogs = new Allonsy.Collections.Blogs([], {
        searchString: this.searchString
      });
    }
    return this._blogs;
  },
  
  initialize: function (options) {
    if (options && options.searchString) {
        this.searchString = options.searchString;
    } else {
        this.searchString = '';
    };
    
    this.posts().fetch({
      remove: false,
      data: { page: 1 }
    });
  }
});