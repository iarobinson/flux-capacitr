Allonsy.Views.FeedShow = Backbone.CompositeView.extend(
  _.extend({}, Allonsy.Mixins.PaginatedView, Allonsy.Mixins.FilterableView, {
    template: JST['feeds/show'],

    className: "feed-show",

    events: {
      "click .post-tag": "toggleFilter"
    },

    initialize: function () {
      this.listenTo(this.collection, 'sync', this.render);
      this.initFilterable();
      setInterval(this.nextPosts.bind(this), 1000);
    },

    addPost: function (post) {
      var postShow = new Allonsy.Views.PostShow({
        model: post,
        displayAvatar: true
      });
      this.addSubview(".posts", postShow.render());
    },

    nextPosts: function () {
      this.nextPage(this.collection);
    },

    removePost: function (post) {
      var subview = _.find(
        this.subviews(".posts"),
        function (subview) {
          return subview.model === post;
        }
      );

      this.removeSubview(".posts", subview);
    },

    render: function () {
      this.$el.html(this.template());
      this.sortPosts();
      this.attachSubviews();
      this.highlightTags();
      return this;
    }
  })
);
