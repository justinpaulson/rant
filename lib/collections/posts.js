Posts = new Mongo.Collection("posts");

Posts.allow({
 insert: function(userId, doc) {
 // only allow posting if you are logged in
 return !! userId;},
 update: function(userId, doc) {
 // only allow updating if you are logged in
 return !! userId;},
 remove: function(userId, doc) {
 // only allow deleting if you are logged in
 return !! userId;
 }
});
