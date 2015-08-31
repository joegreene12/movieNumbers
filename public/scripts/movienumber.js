


var movienumber = movienumber || {};
movienumber.blueprints = movienumber.blueprints || {};
movienumber.active = movienumber.active || {};

movienumber.blueprints.model = Backbone.Model.extend({
  initialize: function() {
      console.log('ready with the model');
  }
});

movienumber.blueprints.collection = Backbone.Collection.extend({
  url: '/api/movienumber',
  model: movienumber.blueprints.model,
  initialize: function() {
    console.log('a collection is ready');
    this.fetch();

    this.on('change', function() {

    });
  }
});
// CREATE CRUD
movienumber.create = function(title, yearrelease, productionbudget, worldwidegross) {

  if (!title || !yearrelease || !productionbudget !worldwidegross) {
    console.log('you are missing a parameter!');
    return false;
  }

  movienumber.active.moviesCollection.create({
    title: title,
    yearrelease: yearrelease,
    productionbudget: productionbudget,
    worldwidegross: worldwidegross
  });
  return true;

};

movienumber.blueprints.collectionView = Backbone.View.extend({
  initialize: function() {
    this.$el = $('.movienumbers');

    this.render();
    var that = this;
    this.collection.on('sync', function() {
      that.render();
    });
  },
  render: funtion() {
    this.$el.html('');

    var models = this.collection.models;

    for (var m in models) {
      var data = models[m];
      new movienumber.blueprints.modelView({
        model: data
      });
    }
  }
});

movienumber.blueprints.modelView = Backbone.View.extend({
  initialize: function() {
    this.$el = $('.movienumbers');
    this.template = _.template($('#table-row-template').html());
    this.render();
  },
  render: funtion() {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
  }
});


$(document).ready(function() {
  movienumber.active.moviesCollection = new movienumber.blueprints.collection();
  movienumber.active.moviesCollectionView = new movienumber.blueprints.collectionView({
    collection: movienumber.active.moviesCollection
  });

  $('#add-movienumber').on('click', function(event) {
    event.preventDefault();

    var title = $('#title').val();
    var yearrelease = $('#yearrelease').val();
    var productionbudget = $('#productionbudget').val();
    var worldwidegross = $('#worldwidegross').val();

    movienumber.create(title, yearrelease, productionbudget, worldwidegross);

  });

  $('#refresh-movienumber').on('click', function() {
    movienumber.active.moviesCollection.fetch();
  });

})
