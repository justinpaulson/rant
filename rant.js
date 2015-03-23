if (Meteor.isClient) {
  // counter starts at 0
  (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=930625576966012&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  Meteor.subscribe("userData");
  Meteor.subscribe("categories");
}

if (Meteor.isServer) {
  
  Meteor.startup(function () {
    UploadServer.init({
      tmpDir: process.env.PWD + '/public/tmp',
      uploadDir: process.env.PWD + '/public/'
    })
  });

  Meteor.publish("userData", function () {
    if (this.userId) {
      return Meteor.users.find({_id: this.userId},{fields: {'admin': true}});
    } else {
      this.ready();
    }
  });

  Meteor.publish("categories", function () {
    return Categories.find();
  });

  Meteor.methods({getCategories: function (name) {
    return Categories.findOne({name: name});
  }});

  Meteor.methods({getAllPosts: function () {
    var posts = [];
    var category;
    Posts.find({}).fetch().forEach(function (element, index, array) {
      category = Categories.findOne({name: element.category});
      posts.push(_.extend(element, {url:'http://blog.rebil.co/posts/'+element._id._str, category_color: category.color, category_image: category.image}));
    });
    return posts;
  }});

  Meteor.methods({getCategoryPosts: function (category) {
    var posts = [];
    var category;
    Posts.find({category: category}).fetch().forEach(function (element, index, array) {
      category = Categories.findOne({name: element.category});
      posts.push(_.extend(element, {url:'http://blog.rebil.co/posts/'+element._id._str, category_color: category.color, category_image: category.image}));
    });
    return posts;
  }});

  Meteor.methods({getPost: function (id) {
    var post, category;
    post = Posts.findOne(id);
    category = Categories.findOne({name: post.category});
    return _.extend(post, {url:'http://blog.rebil.co/posts/'+id, category_color: category.color, category_image: category.image});
  }});
}
