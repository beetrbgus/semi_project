jQuery(document).ready(function($) {
  $('.app-dropdown-toggle').on('click', function() {
    $(this).closest('.app-dropdown').toggleClass('active')
  })

  const appDropdown = $('.app-dropdown')

  $(document).mouseup(e => {
    if (!appDropdown.is(e.target) && appDropdown.has(e.target).length === 0) {
      appDropdown.removeClass('active')
   }
  })
})