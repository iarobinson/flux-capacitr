Allonsy.Views.FilterableView = Backbone.CompositeView.extend({
  events: {
    "click .post-tag": "toggleFilter"
  },
  
  initialize: function () {
    this.collection = this.model.posts();
    this.listenTo(this.collection.filtered, "add", this.addModel);
    this.listenTo(this.collection.filtered, "remove", this.removeModel);
    
    this.filterParams = {};
    
    var blogHeaderView = new Allonsy.Views.BlogHeader({ model: this.model });
    this.addSubview(".blog-header", blogHeaderView.render());
    
    this.collection.filtered.each(this.addPost.bind(this));
    setInterval(this.nextPage.bind(this), 1000);
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
      tagItems.addClass("active");
    }
    this.collection.filterBy({
      tags: this.filterTags
    });
  }
});