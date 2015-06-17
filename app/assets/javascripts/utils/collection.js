_.extend(Backbone.Collection, {
  getOrFetch: function (id) {
    var collection = this;
    var model = this.get(id);

    if (model) {
      model.fetch();
    } else {
      model = new this.model({ id: id });
      model.fetch({
        success: function () { models.add(model); }
      });
    }

    return model;
  },
});
