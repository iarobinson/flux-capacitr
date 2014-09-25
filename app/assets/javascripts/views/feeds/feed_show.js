Allonsy.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST['feeds/show'],
  
  className: "feed-show",
  
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
    return this;
  }
});