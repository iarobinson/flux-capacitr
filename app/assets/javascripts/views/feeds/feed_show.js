Allonsy.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST['feeds/show'],
  
  className: "feed-show",
  
  events: {
    "click #fetch-posts": "fetchPosts",
    "click .post-tag": "toggleFilter"
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.posts().filtered, "add", this.addPost);
    this.listenTo(this.model.posts().filtered, "remove", this.removePost);
    this.listenTo(this.model.posts().filtered, "sort", this.render);
    
    this.filterTags = [];
    
    this.model.posts().filtered.each(this.addPost.bind(this));
    setInterval(this.nextPage.bind(this), 1000);
  },
  
  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    this.addSubview(".posts", postShow.render());
  },
  
  nextPage: function () {
    var self = this;
    if (this.$('.spinner').visible()) {
      if (self.model.posts().page < self.model.posts().total_pages) {
        self.model.posts().fetch({
          data: { page: parseInt(this.model.posts().page) + 1 },
          remove: false,
          wait: true
        });
      } else {
        self.$('.spinner').remove();
      }
    }
  },
  
  removePost: function (post) {
    var subview = _.find(
      this.subviews(".posts"),
      function (subview) {
        return subview.model === post;
      }
    );
    
    this.removeSubview(".posts", subview);
  },
  
  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.sortPosts();
    this.attachSubviews();
    return this;
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
      tagItems.addClass("active");
    }
    this.model.posts().filterBy({
      tags: this.filterTags
    });
  }
});