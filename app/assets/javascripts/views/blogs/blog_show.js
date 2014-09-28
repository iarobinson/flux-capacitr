Allonsy.Views.BlogShow = Backbone.CompositeView.extend({
  template: JST['blogs/show'],
  
  newPostTemplate: JST['posts/edit'],
  
  className: "blog-show",
  
  events: {
    "click #post-to-blog": "newPostForm",
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.posts(), "add", this.addPost);
    this.listenTo(this.model.posts(), "remove", this.removePost);
    
    var blogHeaderView = new Allonsy.Views.BlogHeader({ model: this.model });
    this.addSubview(".blog-header", blogHeaderView.render());
    
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
  
  attachPostForm: function (post) {
    var subview = new Allonsy.Views.PostShow({ model: post });
    subview.open = true;
    subview.parentView = this;
    subview.$el.addClass('new-post');
    
    this.subviews('.posts').push(subview);
    this.$('.posts').prepend(subview.render().$el);
    subview.delegateEvents();
  },
  
  closePostForm: function (view) {
    this.authoring = false;
    this.removeSubview('.posts', view);
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
      }
    }
  },
  
  newPostForm: function (event) {
    if (!this.authoring) {
      this.authoring = true;
      
      var newPost = new Allonsy.Models.Post({
        blog_id: this.model.get('id'),
        blog_url: this.model.get('url')
      });
      
      this.attachPostForm(newPost)
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
    var renderedContent = this.template({ blog: this.model });
    this.$el.html(renderedContent);
    this.attachSubviews();
    this.listenForScroll();
    return this;
  }
});