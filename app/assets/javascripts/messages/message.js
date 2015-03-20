var Message = function(args){
  args = args || {}
  this.subject = args.subject;
  this.content = args.content;
  this.mentee_id = args.mentee_id;
  this.mentor_id = args.mentor_id;
}
