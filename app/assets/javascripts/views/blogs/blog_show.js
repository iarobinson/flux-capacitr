Allonsy.Views.BlogShow = Backbone.FilterableView.extend({
  template: JST['blogs/show'],

  newPostTemplate: JST['posts/edit'],

  className: "blog-show clearfix",

  events: {
    "click #post-to-blog": "newPostForm",
    "click .post-tag": "toggleFilter"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    Backbone.FilterableView.prototype.initialize.apply(this);
    setInterval(this.nextPosts.bind(this), 1000);

    var blogHeaderView = new Allonsy.Views.BlogHeader({ model: this.model });
    this.addSubview(".blog-header", blogHeaderView.render());
  },

  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    if (!post.has('id')) {
      postShow.open = true;
      postShow.parentView = this;
    }
    this.addSubview(".posts", postShow.render());
  },

  attachPostForm: function (post) {
    var subview = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    subview.open = true;
    subview.parentView = this;
    subview.$el.addClass('new-post');
    setTimeout(function () {
      subview.$el.removeClass('new-post');
    }, 500);

    this.subviews('.posts').push(subview);
    this.$('.posts').prepend(subview.render().$el);
    subview.delegateEvents();
  },

  closePostForm: function (view) {
    this.authoring = false;
    this.removeSubview('.posts', view);
  },

  nextPosts: function () {
    this.nextPage(this.model.posts());
  },

  newPostForm: function (event) {
    if (!this.authoring) {
      this.authoring = true;
      var view = this;

      $.ajax('/api/blogs/' + this.model.get('id') + '/posts/new', {
        success: function (response) {
          var newPost = new Allonsy.Models.Post(response);
          view.attachPostForm(newPost);
          // view.model.posts().add(newPost);
        }
      });
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

  renderTemplate: function () {
    return this.template({ blog: this.model });
  }
});
