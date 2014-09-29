Allonsy.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST['feeds/show'],
  
  className: "feed-show",
  
  events: {
    "click #fetch-posts": "fetchPosts"
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.posts(), "add", this.addPost);
    this.listenTo(this.model.posts(), "remove", this.removePost);
    
    this.model.posts().each(this.addPost.bind(this));
  },
  
  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({ model: post });
    if (!post.has('id')) {
      postShow.open = true;
      postShow.parentView = this;
    }
    this.addSubview(".posts", postShow.render());
  },
  
  listenForScroll: function () {
    $(window).off('scroll');
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on('scroll', throttledCallback);
  },
  
  nextPage: function () {
    var self = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      if (self.model.posts().page < self.model.posts().total_pages) {
        self.model.posts().fetch({
          data: { page: parseInt(this.model.posts().page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.spinner').remove();
      }
    }
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
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    this.listenForScroll();
    return this;
  }
});