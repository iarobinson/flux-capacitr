Allonsy.Views.PostControl = Backbone.View.extend({
  template: JST['posts/post_control'],
  
  className: "post-control pull-right",
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  
  render: function () {
    var renderedContent = this.template({ post: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});