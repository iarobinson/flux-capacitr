Allonsy.Router = Backbone.Router.extend(
  _.extend({}, Allonsy.Mixins.SwappingRouter, {
    routes: {
      '': 'feedShow',
      'blogs/:id': 'blogShow',
      'posts/:id': 'postShow',
      'search/:searchString': 'searchShow'
    },

    blogShow: function (id) {
      var blog = Allonsy.Collections.blogs.getOrFetch(id);
      blog.posts().fetch();
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
  })
);
