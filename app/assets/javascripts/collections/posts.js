Allonsy.Collections.Posts = Backbone.Collection.extend({
  filterBy: function (params) {
    var filteredColl = this.filter(function (item) {
      return _(params.tags).all(function(tag) {
        return _(item.tags().pluck('label')).contains(tag);
      });
    });

    this.filtered.params = params;
    this.filtered.set(filteredColl);
  },

  filterTags: function () {
    if (!this._filterTags) {
      this._filterTags = [];
    }

    return this._filterTags;
  },

  initialize: function (models, options) {
    this.filtered = new Backbone.Collection(models);
    this.filtered.params = {tags: []};
    this.on('add', this.refilter);
    this.on('remove', this.refilter);

    if (options) {
      if (options.blog) {
        this.blog = options.blog;
      }
      if (options.searchString) {
        this.searchString = options.searchString;
      }
    }
  },

  model: Allonsy.Models.Post,

  parse: function (response) {
    this.page = response.page;
    this.total_pages = response.total_pages;
    return response.posts;
  },

  refilter: function () {
    this.filterBy(this.filtered.params);
  },

  url: function () {
    if (this.blog) {
      return '/api/blogs/' + this.blog.id + '/posts'
    } else if (this.searchString) {
      return '/api/posts/search/' + this.searchString;
    } else {
      return '/api/feed'
    }
  }
});
