Allonsy.Views.PaginatedView = Backbone.CompositeView.extend({
  initialize: function () {
    // this.paginatable = this.model.posts();
    setInterval(this.nextPage.bind(this), 1000);
  },
  
  nextPage: function () {
    var self = this;
    if (this.$('.spinner').visible()) {
      if (self.paginatable.page < self.paginatable.total_pages) {
        self.paginatable.fetch({
          data: { page: parseInt(this.paginatable.page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.spinner').remove();
      }
    }
  }
});