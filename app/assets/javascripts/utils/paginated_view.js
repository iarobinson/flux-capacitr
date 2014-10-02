Backbone.PaginatedView = Backbone.CompositeView.extend({
  initialize: function () {
    // set callback to load next page.
    setInterval(this.nextPage.bind(this), 1000);
  },
  
  nextPage: function (collection) {
    var self = this;
    if (this.$('.spinner').visible()) {
      if (collection.page < collection.total_pages) {
        collection.fetch({
          data: { page: parseInt(collection.page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.spinner').remove();
      }
    }
  }
});