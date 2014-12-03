var TodoListView = function TodoListView(options) {
  options = options || {};
  this.$el = options.$el || $("<ul>");
  this.collection = options.collection;
  var that = this;
  $(this.collection).on("change", $.proxy(this.render, that));
  // var that = this
  // $(this.collection).on("change", function(){
  //   that.render();
  // });
}

TodoListView.prototype.render = function render() {
  this.$el.empty();
  var models = this.collection.models;
  for (var i = 0; i < models.length; i++) {
    var todo = models[i];
    var view = new TodoView({model: todo});
    this.$el.append(view.render().$el);
  }
  return this;
}