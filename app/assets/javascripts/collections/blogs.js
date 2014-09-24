Allonsy.Collections.Blogs = Backbone.Collection.extend({
  getOrFetch: function (id) {
    var blogs = this;
    
    var blog = this.get(id);
    if (!blog) {
      blog = new Allonsy.Models.Blog({ id: id });
      blog.fetch({
        success: function () { blogs.add(blog); }
      });
    }

    return blog;
  }
});

Allonsy.Collections.blogs = new Allonsy.Collections.Blogs();