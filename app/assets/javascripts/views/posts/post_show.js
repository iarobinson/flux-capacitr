Allonsy.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/show'],
  
  formTemplate: JST['posts/edit'],
  
  className: "post-show",
  
  events: {
    "click #cancel-edit": "cancelEdit",
    "click #commit-edit": "commitEdit",
    "click #delete-post": "deletePost",
    "click #edit-post": "openEdit",
    "click #like-toggle": "toggleLike"
  },
  
  deletePost: function (event) {
    if (confirm("Are you sure you want to delete this post?")) {
      if (this.parentView) {
        this.parentView.removePost(this.model);
      }
      this.model.destroy();
    }
  },
  
  cancelEdit: function (event) {
    if (this.model.has('id')) {
      this.open = false;
      this.render();          
    } else {
      this.parentView.closePostForm(this);
    }
  },
  
  commitEdit: function (event) {
    event.preventDefault();
    var view = this;
    var formData = this.$('form').serializeJSON()['post'];
    this.model.save(formData, {
      success: function (response) {
        if (view.parentView) {
          view.parentView.authoring = false;
          view.parentView.removePost(view.model);
          view.parentView.posts().add(view.model);
        } else {
          view.open = false;
          view.render();
        }
      }
    });
  },
  
  openEdit: function (event) {
    this.open = true;
    this.render();
  },
  
  initialize: function (options) {
    if (options.displayAvatar) {
      this.displayAvatar = options.displayAvatar;
    }
    
    this.open = false;
    
    this.listenTo(this.model, 'sync', this.render);
    var postFooterView = new Allonsy.Views.PostFooter({ model: this.model });
    this.addSubview(".post-footer", postFooterView.render());
  },
  
  render: function () {
    var renderedContent;
    
    if(this.open) {
      renderedContent = this.formTemplate({
        post: this.model,
        displayAvatar: this.displayAvatar
      });
    } else {
      renderedContent = this.template({
        post: this.model,
        displayAvatar: this.displayAvatar
      });
    }
    
    this.$el.html(renderedContent);
    this.attachSubviews();
    this.$("#post-body").markdown({ fullscreen: { enable: false }, resize: 'vertical' });
    return this;
  },
  
  toggleLike: function (event) {
    $.ajax('/api/posts/' + this.model.id + '/togglelike', {
      type: 'POST',
      success: function (response) {
        this.model.set('is_liked', response.is_liked);
        this.model.set('num_likes', response.num_likes);
        this.render();
      }.bind(this),
      error: function () {
        console.log('Something went wrong!');
      }
    });
  }
});