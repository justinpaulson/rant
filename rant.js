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
    console.log("Got here");
    return Categories.findOne({name: name});
  }});
}
