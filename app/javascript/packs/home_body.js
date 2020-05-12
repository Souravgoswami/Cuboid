const heading = document.getElementById('heading')
const caret = document.getElementById('caret')
const headings = heading.innerHTML.split('%-%').map(x => x.split(''))
heading.innerHTML = ''

let h_ind = 0, i = 0, j = headings[0].length, initTime = Date.now()

headings.innerHTML = ''
setInterval(() => {
	if(i === headings[h_ind].length) {
		if(heading.innerHTML === '') {
			h_ind = (h_ind + 1) % headings.length
			i = 0
			j = headings[h_ind].length
		} else if(Date.now() - initTime > 5000) {
			if(caret.style.animation !== 'none') caret .style.animation = 'none'
			heading.innerHTML = heading.innerHTML.slice(0, --j)
		} else {
			caret .style.animation = 'blink 0.5s ease-in-out infinite'
		}
	} else {
		if(caret.style.animation !== 'none') caret .style.animation = 'none'
		initTime = Date.now()
		heading.innerHTML += headings[h_ind][i++]
	}
}, 75)
