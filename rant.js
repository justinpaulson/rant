if (Meteor.isClient) {
  // counter starts at 0
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    UploadServer.init({
      tmpDir: process.env.PWD + '~/uploads/tmp',
      uploadDir: process.env.PWD + '~/uploads/'
    })
  });

  Meteor.methods({getCategories: function (name) {
    return Categories.findOne({name: name});
  }});

  Meteor.methods({getAllPosts: function () {
    var posts = [];
    var category;
    Posts.find({}).fetch().forEach(function (element, index, array) {
      category = Categories.findOne({name: element.category});
      posts.push(_.extend(element, {category_color: category.color, category_image: category.image}));
    });
    return posts;
  }});

  Meteor.methods({getCategoryPosts: function (category) {
    var posts = [];
    var category;
    Posts.find({category: category}).fetch().forEach(function (element, index, array) {
      category = Categories.findOne({name: element.category});
      posts.push(_.extend(element, {category_color: category.color, category_image: category.image}));
    });
    return posts;
  }});

  Meteor.methods({getPost: function (id) {
    var post, category;
    post = Posts.findOne(id);
    category = Categories.findOne({name: post.category});
    return _.extend(post, {category_color: category.color, category_image: category.image});
  }});
}
