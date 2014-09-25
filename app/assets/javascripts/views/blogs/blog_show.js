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
  
  closePostForm: function (view) {
    this.authoring = false;
    this.model.posts().remove(view.model);
  },
  
  newPostForm: function (event) {
    if (!this.authoring) {
      this.authoring = true;
      var view = this;
      
      var newPost = new Allonsy.Models.Post({
        blog_id: this.model.get('id'),
        blog_url: this.model.get('url')
      });
      
      this.model.posts().add(newPost);
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
    return this;
  }
});