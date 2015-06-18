Allonsy.Views.BlogNameplate = Backbone.View.extend({
  template: JST['blogs/nameplate'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.following(), 'change:id', this.render);
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
    event.preventDefault();
    this.model.toggleFollow();
  }
});
