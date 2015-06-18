Allonsy.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.blogs = options.blogs || new Allonsy.Collections.Blogs();
  },

  routes: {
    '': 'feedShow',
    'blogs/:id': 'blogShow',
    'posts/:id': 'postShow',
    'search/:searchString': 'searchShow'
  },

  blogShow: function (id) {
    var blog = this.blogs.getOrFetch(id);
    blog.posts().fetch();
    var view = new Allonsy.Views.BlogShow({
      model: blog,
      collection: blog.posts()
    });
    this._swapView(view);
  },

  feedShow: function () {
    var posts = new Allonsy.Collections.Posts();
    posts.fetch({
      remove: false,
      data: { page: 1 }
    });
    var view = new Allonsy.Views.FeedShow({ collection: posts });
    this._swapView(view);
  },

  postShow: function (id) {
    var post = new Allonsy.Models.Post({ id: id });
    post.fetch();
    var view = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });

    this._swapView(view);
  },

  searchShow: function (searchString) {
    var search = new Allonsy.Models.Search({ searchString: searchString });
    var view = new Allonsy.Views.SearchShow({ model: search });
    this._swapView(view);
  }
});
