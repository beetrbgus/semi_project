jQuery(function($) {
  $('.app-sidebar-left__nav__more').on('click', function() {
    $(this).parent().parent().toggleClass('open')
  })
})