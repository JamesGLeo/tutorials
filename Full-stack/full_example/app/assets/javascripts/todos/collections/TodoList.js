var TodoList = function TodoList(options) {
  options = options || {};
  this.models = [];
  this.model = options.model;
};

// list = new TodoList({model: Todo});

TodoList.prototype.add = function add(model) {
  this.models.push(model);
  $(this).trigger("change");
  return this;
};

TodoList.prototype.create = function create(todoOptions) {
  var that = this;
  $.ajax({
    url: '/todos',
    method: 'post',
    dataType: 'json',
    data: { todo: todoOptions },
    success: function(data) {
      // var todo = new Todo(data.todo);
      var todo = new that.model(data.todo);
      that.add(todo);
    }
  })
}

TodoList.prototype.fetch = function fetch() {
  var that = this;
  $.ajax({
    url: '/todos',
    method: 'get',
    dataType: 'json',
    success: function(data) {
      that.models = []; // make empty
      $(data.todos).each(function(idx, todoOptions) {
        var todo = new that.model(todoOptions);
        that.add(todo);
      });
    }
  })
}





















