var MessageCollection = function(){
  // starts with empty array
  this.models = [];
}

MessageCollection.prototype.add = function(message){
  // Add message to models array
  this.models.push(message);
  $(this).trigger('change');
}

MessageCollection.prototype.fetch = function(){
  // preserve the MessageCollection context in
  // the variable messageCollection
  var messageCollection = this;
  $.ajax({
    url: '/messages',
    dataType: 'json',
    success: function(data){
      data.forEach(function(message){
        // for each message, make a new message model
        // and add it ot the collection
        var messageModel = new Message(message);
        messageCollection.add(messageModel);
      })
    }
  })
};