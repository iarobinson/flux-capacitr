Allonsy.Views.BlogShow = Backbone.PaginatedView.extend({
  template: JST['blogs/show'],
  
  newPostTemplate: JST['posts/edit'],
  
  className: "blog-show clearfix",
  
  events: {
    "click #post-to-blog": "newPostForm",
    "click .post-tag": "toggleFilter"
  },
  
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.posts().filtered, "add", this.addPost);
    this.listenTo(this.model.posts().filtered, "remove", this.removePost);
    this.listenTo(this.model.posts().filtered, "sort", this.render);
    
    this.filterTags = [];
    
    var blogHeaderView = new Allonsy.Views.BlogHeader({ model: this.model });
    this.addSubview(".blog-header", blogHeaderView.render());
    
    this.model.posts().filtered.each(this.addPost.bind(this));
    setInterval(this.nextPosts.bind(this), 1000);
  },
  
  addPost: function (post) {
    var postShow = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    if (!post.has('id')) {
      postShow.open = true;
      postShow.parentView = this;
    }
    this.addSubview(".posts", postShow.render());
  },
  
  attachPostForm: function (post) {
    var subview = new Allonsy.Views.PostShow({
      model: post,
      displayAvatar: true
    });
    subview.open = true;
    subview.parentView = this;
    subview.$el.addClass('new-post');
    
    this.subviews('.posts').push(subview);
    this.$('.posts').prepend(subview.render().$el);
    subview.delegateEvents();
  },
  
  closePostForm: function (view) {
    this.authoring = false;
    this.removeSubview('.posts', view);
  },
  
  highlightTags: function () {
    this.filterTags.forEach(function (tagName) {
      var tagItems = this.$('*[data-tag=\"' + tagName + '"]');
      tagItems.addClass("active");
    });
  },
  
  nextPosts: function () {
    this.nextPage(this.model.posts());
  },
  
  newPostForm: function (event) {
    if (!this.authoring) {
      this.authoring = true;
      var view = this;
      
      $.ajax('/api/blogs/' + this.model.get('id') + '/posts/new', {
        success: function (response) {
          var newPost = new Allonsy.Models.Post(response);
          view.attachPostForm(newPost);
        }
      });
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
    var renderedContent = this.template({ blog: this.model });
    this.$el.html(renderedContent);
    this.sortPosts();
    this.attachSubviews();
    this.highlightTags();
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
    }
    this.model.posts().filterBy({
      tags: this.filterTags
    });
  }
});