window.Allonsy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert('Hello from Backbone!');
    new Allonsy.Router();
    Backbone.history.start();
  }
};

// ADD THIS WHERE IT NEEDS TO BE LOADED (blog show page?)
// $(document).ready(function(){
//   Allonsy.initialize();
// });