Allonsy.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/show'],
  
  className: "post-show",
  
  events: {
    "click #delete-post": "deletePost",
    "click #edit-post": "editPost"
  },
  
  deletePost: function (event) {
    if (confirm("Are you sure you want to delete this post?")) {
      this.model.destroy();
    }
  },
  
  editPost: function (event) {
    
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    
    var postFooterView = new Allonsy.Views.PostFooter({ model: this.model });
    this.addSubview(".post-footer", postFooterView.render());
  },
  
  render: function () {
    var renderedContent = this.template({ post: this.model });
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});