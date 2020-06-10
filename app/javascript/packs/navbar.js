const DELAY_MENU = 250
var i = 1

window.toggleMenu = (sideNavId, toggleIconId, sideNavMenuId, hideButtonId) => {
	let sidenav = document.getElementById(sideNavId)
	let toggleIcon = document.getElementById(toggleIconId)
	let sideNavMenu = document.getElementById(sideNavMenuId)
	let hideButton = document.getElementById(hideButtonId)

	sideNavMenu.style.animation = `rotateAnim ${DELAY_MENU}ms ease`

	i += 1
	if (i % 2 === 0) {
		sidenav.style.transform = `translateX(0)`
		toggleIcon.innerHTML = '&#10005;'
		hideButton.style.opacity = '1'
	} else {
		sidenav.style.transform = `translateX(-150%)`
		toggleIcon.innerHTML = '&#9776;'
		hideButton.style.opacity = '0'
	}

	setTimeout(() => {
		sideNavMenu.style.animation = 'none'
	}, DELAY_MENU + 1)
}
