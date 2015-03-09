Allonsy.Views.SearchShow = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, {
    template: JST['searches/show'],

    className: "search-show",

    initialize: function () {
      this.listenTo(this.model, 'sync', this.render);

      this.listenTo(this.model.posts(), "add", this.addPost);
      this.listenTo(this.model.posts(), "remove", this.removePost);
      this.model.posts().each(this.addPost.bind(this));

      this.listenTo(this.model.blogs(), "add", this.addBlog);
      this.listenTo(this.model.blogs(), "remove", this.removeBlog);
      this.model.blogs().each(this.addBlog.bind(this));

      setInterval(this.nextResults.bind(this), 1000);
    },

    addBlog: function (blog) {
      var blogShow = new Allonsy.Views.BlogNameplate({ model: blog });
      this.addSubview("#blogs", blogShow.render());
    },

    addPost: function (post) {
      var postShow = new Allonsy.Views.PostShow({
        model: post,
        displayAvatar: false
      });
      this.addSubview("#posts", postShow.render());
    },

    nextResults: function () {
      this.nextPage(this.model.blogs());
      this.nextPage(this.model.posts());
    },

    removeBlog: function (blog) {
      var subview = _.find(
        this.subviews("#blogs"),
        function (subview) {
          return subview.model === blog;
        }
      );

      this.removeSubview("#blogs", subview);
    },

    removePost: function (post) {
      var subview = _.find(
        this.subviews("#posts"),
        function (subview) {
          return subview.model === post;
        }
      );

      this.removeSubview("#posts", subview);
    },

    render: function () {
      var renderedContent = this.template();
      this.$el.html(renderedContent);
      this.attachSubviews();
      return this;
    }
  })
);
