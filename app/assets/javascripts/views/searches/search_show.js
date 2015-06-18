Allonsy.Views.SearchShow = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, {
    template: JST['searches/show'],

    className: "search-show",

    initialize: function () {
      this.addBlogsIndex();
      this.addPostsIndex();
    },

    addBlogsIndex: function () {
      var blogs = new Allonsy.Collections.Blogs();
      blogs.fetch();
      var subview = new Allonsy.Views.BlogsIndex({
        collection: blogs
      });
      this.addSubview(".blogs-pane", subview);
    },

    addPostsIndex: function () {
      var posts = new Allonsy.Collections.Posts();
      posts.fetch();
      var subview = new Allonsy.Views.PostsIndex({
        collection: posts
      });
      this.addSubview(".posts-pane", subview);
    },

    render: function () {
      var renderedContent = this.template();
      this.$el.html(renderedContent);
      this.attachSubviews();
      return this;
    }
  })
);
