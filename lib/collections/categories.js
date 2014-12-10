Categories = new Mongo.Collection("categories");

Categories.allow({
 insert: function(userId, doc) {
 // only allow posting if you are logged in
 return !! userId;},
 remove: function(userId, doc) {
 // only allow deleting if you are logged in
 return !! userId;
 }
});
