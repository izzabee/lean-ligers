// var MessageCollectionView = function(collection){
//   // save the collection
//   this.collection = collection;
//   $(this.collection).on('change', this.render.bind(this));

//   // set messageCollectionView to 'this' to maintain the context
//   var messageCollectionView = this;
//   var $getMessage = $('.get-message');
//   var $form = $('.compose');
//   var $closeForm = $('.close-window');
//   var $sendMessage = $('#send-message');
//   var formElements;
//   var formData;
  
//   $form.hide();

//   // this shows the message form
//   $getMessage.on('click', function(e){
//     $(this).next().slideDown();
//   $closeForm.on('click', function(e){
//     $form.slideUp();
//   });

//     // this gets the message from the form
//     $sendMessage.on('click', function(e){
//       e.preventDefault();
//       formElements = $form[0].elements;
//       formData = new Message({
//         subject: formElements.subject.value,
//         content: formElements.content.value
//         mentee_id: formElements.mentee_id.value,
//         mentor_id: formElements.mentor_id.value,
//       });

//       // and this sends it to server
//       $.ajax({
//         url: '/messages',
//         type: 'POST',
//         dataType: 'json',
//         data: formData,
//         success: function(formData){
//           $form[0].reset();
//           $form.hide();
//         }
//       })
//     })
//   });

   

//    messageCollectionView.collection.add(formData);


// MessageCollectionView.prototype.$el = function(){
//   return $('.inbox');
// }

// MessageCollectionView.prototype.render = function(){
//   // empty out the element so that we re-render it
//   this.collection.models.forEach(function(model){
//     var newView = new MessageView(model);
//     this.$el().append(newView.render().$el);
//   }.bind(this))
// }