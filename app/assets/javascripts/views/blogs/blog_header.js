Allonsy.Views.BlogHeader = Backbone.View.extend({
  template: JST['blogs/blog_header'],
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  
  events: {
    "click #follow-toggle": "toggleFollowing"
  },
  
  render: function () {
    var renderedContent = this.template({ blog: this.model });
    this.$el.html(renderedContent);
    return this;
  },
  
  toggleFollowing: function (event) {
    $.ajax('/api/blogs/' + this.model.id + '/togglefollow', {
      type: 'POST',
      success: function () {
        this.model.set('is_followed', !this.model.get('is_followed'));
        this.render(); // probably slow, optimize later!
      }.bind(this),
      error: function () {
        console.log('Something went wrong!');
      }
    })
  }
});