jQuery(function($) {
  const wrapper = $('.app-layout-bottom-nav')
  const component = $('.app-bottom-nav')

  // if(window.navigator.platform === 'iPhone') {
  //   wrapper.addClass('app-is-ios')
  //   component.addClass('app-is-ios')
  // }

  $('.app-bottom-nav li > a.app-bottom-nav__auto').on('click', function() {
    const id = $(this).parent().attr('data-menu-id');
    appBottomNavItem(id);
  })
})

function appBottomNavSetActice(id) {
  const component = $('.app-bottom-nav')
  
  component.attr('data-current-menu', id)
  component.find('li > a').removeClass('app-active')
  component.find('li[data-menu-id="' + id + '"] > a').addClass('app-active')

  $('.app-bottom-nav-container').hide()
  $('.app-bottom-nav-container[data-menu-id="' + id + '"]').show()
}

function appBottomNavItem(id) {
  console.log(id)
  const component = $('.app-bottom-nav')
  const isLoggedIn = component.attr('data-logged-in')
  console.log(isLoggedIn)

 if(!isLoggedIn) {
  if(id === 'notification' || id === 'message') {
    appToast('로그인이 필요합니다.', 'danger')
    return
  }
 }

  appBottomNavSetActice(id)
  const el = document.documentElement

  if(id === 'home') {
    el.style.overflow = 'auto'
  } else {
    el.style.overflow = 'hidden'
  }
}