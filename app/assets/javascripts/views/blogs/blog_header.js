Allonsy.Views.BlogHeader = Backbone.View.extend({
  template: JST['blogs/blog_header'],
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  
  render: function () {
    var renderedContent = this.template({ blog: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});