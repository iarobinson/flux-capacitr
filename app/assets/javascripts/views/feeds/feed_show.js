Allonsy.Views.FeedShow = Backbone.FilterableView.extend({
  template: JST['feeds/show'],
  
  className: "feed-show",
  
  events: {
    "click .post-tag": "toggleFilter"
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    Backbone.FilterableView.prototype.initialize.apply(this);
    setInterval(this.nextPosts.bind(this), 1000);
  },
  
  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    this.addSubview(".posts", postShow.render());
  },
  
  nextPosts: function () {
    this.nextPage(this.model.posts());
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
  
  renderTemplate: function () {
    return this.template();
  }
});