Allonsy.Views.PostsIndex = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, {
    template: JST['posts/index'],

    initialize: function () {
      this.listenTo(this.collection, "add", this.addPost);
      this.listenTo(this.collection, "remove", this.removePost);
      this.collection.each(this.addPost.bind(this));

      setInterval(this.nextResults.bind(this), 1000);
    },

    addPost: function (post) {
      var subview = new Allonsy.Views.PostShow({ model: post });
      this.addSubview(".posts", subview);
    },

    nextResults: function () {
      this.nextPage(this.collection);
    },

    removePost: function (post) {
      this.removeModelSubview(".posts", post);
    },

    render: function () {
      var renderedContent = this.template();
      this.$el.html(renderedContent);
      this.attachSubviews();
      return this;
    }
  })
);
