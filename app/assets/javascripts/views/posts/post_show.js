Allonsy.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/show'],
  
  formTemplate: JST['posts/edit'],
  
  className: "post-show",
  
  events: {
    "click #cancel-edit": "cancelEdit",
    "click #commit-edit": "commitEdit",
    "click #delete-post": "deletePost",
    "click #edit-post": "openEdit"
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
        }
        view.open = false;
        view.render();
      }
    });
  },
  
  openEdit: function (event) {
    this.open = true;
    this.render();
  },
  
  initialize: function () {
    this.open = false;
    
    this.listenTo(this.model, 'sync', this.render);
    var postFooterView = new Allonsy.Views.PostFooter({ model: this.model });
    this.addSubview(".post-footer", postFooterView.render());
  },
  
  render: function () {
    if(this.open) {
      renderedContent = this.formTemplate({ post: this.model });
    } else {
      renderedContent = this.template({ post: this.model });
    }
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});