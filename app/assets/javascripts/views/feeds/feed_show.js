Allonsy.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST['feeds/show'],
  
  className: "feed-show",
  
  events: {
    "click #fetch-posts": "fetchPosts"
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.posts(), "add", this.addPost);
    this.listenTo(this.model.posts(), "remove", this.removePost);
    
    this.model.posts().each(this.addPost.bind(this));
    setInterval(this.nextPage.bind(this), 1000);
  },
  
  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({ model: post });
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
    this.attachSubviews();
    return this;
  }
});