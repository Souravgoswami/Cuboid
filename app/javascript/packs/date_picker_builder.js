$(() => {
	const monthPicker = $('#monthPicker')
	const yearPicker = $('#yearPicker'), date = new Date().getFullYear()

	for(let i = date ; i < date + 100 ; ++i)
		yearPicker.append(`<option>${i}</option>`)

	for(let i = 1 ; i < 13 ; ++i)
		monthPicker.append(`<option>${i}</option>`)
})
