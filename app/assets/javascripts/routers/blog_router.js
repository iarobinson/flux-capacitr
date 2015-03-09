Allonsy.BlogRouter = Backbone.Router.extend(
  _.extend({}, Allonsy.Mixins.SwappingRouter, {
    routes: {
      'blogs/:id': 'blogShow',
      'posts/:id': 'postShow'
    },

    blogShow: function (id) {
      var blog = Allonsy.Collections.blogs.getOrFetch(id);
      blog.posts().fetch();
      var view = new Allonsy.Views.BlogShow({ model: blog });
      this._swapView(view);
    },

    postShow: function (id) {
      var post = new Allonsy.Models.Post({ id: id });
      var router = this;

      post.fetch({
        success: function (response) {
          var view = new Allonsy.Views.PostShow({
            model: post,
            displayAvatar: true
          });

          router._swapView(view);
        }
      });
    }
  })
);
