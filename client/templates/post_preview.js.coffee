Template.postPreview.helpers
  createdAtFormatted: -> moment(Session.get('createdAt')).format('MMMM Do YYYY')
