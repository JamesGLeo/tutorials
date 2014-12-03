var Todo = function Todo(options) {
  options = options || {};
  this.text = options.text;
  this.createdAt = new Date();
};