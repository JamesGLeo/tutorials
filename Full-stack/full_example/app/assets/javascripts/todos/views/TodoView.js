var TodoView = function TodoView(options) {
  options = options || {}
  this.model = options.model;
}

// TodoView.prototype.render = function render() {
//   var $li = $("<li>");
//   var $div = $("<div>"+this.model.text+"</div>");
//   this.$el = $li.append($div);
//   return this;
// }

TodoView.prototype.render = function render(){
  //this gives me a string
  var templateText = $("#todo-template").html();
  // this returns a function
  var compiled     = _.template(templateText);
  // we call the functino and pass it an object literal
  // that contains attributes that are referred to
  // inside the template
  this.$el = $(compiled({ todo: this.model }));
  return this;
}