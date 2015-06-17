Allonsy.Mixins.FilterableView = {
  // Set "click .post-tag": "toggleFilter" in the child view's events.

  // Call this in the child view's initialize.
  initFilterable: function () {
    this.listenTo(this.collection.filtered, "add", this.addPost);
    this.listenTo(this.collection.filtered, "remove", this.removePost);
    this.listenTo(this.collection.filtered, "sort", this.render);
    this.filterTags = [];

    this.collection.filtered.each(this.addPost.bind(this));
  },

  highlightTags: function () {
    this.filterTags.forEach(function (tagName) {
      var tagItems = this.$('*[data-tag=\"' + tagName + '"]');
      tagItems.addClass("active");
    });
  },

  sortPosts: function () {
    this.subviews('.posts').sort(function (a, b) {
      return b.model.get('id') - a.model.get('id');
    });
  },

  toggleFilter: function (event) {
    var tagName = $(event.currentTarget).data("tag");
    var tagItems = this.$('*[data-tag=\"' + tagName + '"]');

    if (_.contains(this.filterTags, tagName)) {
      var tagIndex = this.filterTags.indexOf(tagName);
      this.filterTags.splice(tagIndex, 1);
      tagItems.removeClass("active");
    } else {
      this.filterTags.push(tagName);
    }
    this.collection.filterBy({
      tags: this.filterTags
    });
  }
};
