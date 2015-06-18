Allonsy.Views.BlogsIndex = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, {
    template: JST['blogs/index'],

    initialize: function () {
      this.listenTo(this.collection, "add", this.addBlog);
      this.listenTo(this.collection, "remove", this.removeBlog);
      this.collection.each(this.addBlog.bind(this));

      setInterval(this.nextResults.bind(this), 1000);
    },

    addBlog: function (blog) {
      var subview = new Allonsy.Views.BlogsIndexItem({ model: blog });
      this.addSubview(".blogs", subview);
    },

    nextResults: function () {
      this.nextPage(this.collection);
    },

    removeBlog: function (blog) {
      this.removeModelSubview(".blogs", blog);
    },

    render: function () {
      var renderedContent = this.template();
      this.$el.html(renderedContent);
      this.attachSubviews();
      return this;
    }
  })
);
