Allonsy.Views.SearchShow = Backbone.CompositeView.extend({
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
    
    setInterval(this.nextPage.bind(this), 1000);
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
  
  nextBlogs: function () {
    var self = this;
    if (this.$('.blogs-pane .spinner').visible()) {
      if (self.model.blogs().page < self.model.blogs().total_pages) {
        self.model.blogs().fetch({
          data: { page: parseInt(this.model.blogs().page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.blogs-pane .spinner').remove();
      }
    }
  },
  
  nextPage: function () {
    this.nextBlogs();
    this.nextPosts();
  },
  
  nextPosts: function () {
    var self = this;
    if (this.$('.posts-pane .spinner').visible()) {
      if (self.model.posts().page < self.model.posts().total_pages) {
        self.model.posts().fetch({
          data: { page: parseInt(this.model.posts().page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.posts-pane .spinner').remove();
      }
    }
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
});