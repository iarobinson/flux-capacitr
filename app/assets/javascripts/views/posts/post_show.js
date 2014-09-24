Allonsy.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/show'],
  
  className: "post-show",
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    
    var postControlView = new Allonsy.Views.PostControl({ model: this.model });
    this.addSubview(".post-footer", postControlView.render());
  },
  
  render: function () {
    var renderedContent = this.template({ post: this.model });
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});