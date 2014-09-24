Allonsy.Views.PostShow = Backbone.View.extend({
  template: JST['posts/show'],
  
  className: "post-show",
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  
  render: function () {
    var view = this;
    var renderedContent = this.template({ post: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});