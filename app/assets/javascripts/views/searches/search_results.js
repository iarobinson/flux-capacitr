Allonsy.Views.SearchResults = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, {
    template: JST['searches/results'],

    className: "search-show",

    initialize: function (options) {
      this.query = options.query;
      this.addBlogsIndex();
      this.addPostsIndex();
    },

    addBlogsIndex: function () {
      var blogs = new Allonsy.Collections.Blogs();
      blogs.fetch({
        data: { query: this.query }
      });
      var subview = new Allonsy.Views.BlogsIndex({
        collection: blogs
      });
      this.addSubview(".blogs-pane", subview);
    },

    addPostsIndex: function () {
      var posts = new Allonsy.Collections.Posts();
      posts.fetch({
        data: { query: this.query }
      });
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
