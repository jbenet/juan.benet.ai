// requires jquery or a compatible thing.
// requires underscore or a compatible thing.
$(document).ready(function() {
  // Modify this template to add or change links.
  var links = _.template('\
    <div class="header-links">\
      <a href="#<%= id %>"><i class="typcn typcn-link"></i></a>\
    </div>\
  ')

  // If your headers dont already have ids, use this slug fn
  var slugize = function(title) {
    return title.toLowerCase()
      .replace(/[^\w ()]+/g,'')
      .replace(/ +/g,'-')
  }

  // Modify the ':header' selector to apply to other elems
  $(':header').each(function(i, h) {

    // Add an id, if it doesn't have one.
    if (!$(h).attr('id')) {
      // TODO remove next two lines? they dont seem to do anything...
      var id = $(h).text().replace(/[^A-Za-z0-9_]+/g, '-')
      id = id.replace(/^-+|-+$/g, '')

      $(h).attr('id', slugize($(h).text()))
    }

    // Add the link div
    $(h).append($(links({
      id: $(h).attr('id')
    })))
  })
})
