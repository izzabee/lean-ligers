var MessageView = function(model){
  this.model = model;
  this.$el = $('<p></p>');
}

MessageView.prototype.render = function(){
  this.$el.text(this.model.name);
  return this;
}