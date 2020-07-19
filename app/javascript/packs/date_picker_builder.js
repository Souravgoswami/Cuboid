$(() => {
	const monthPicker = $('#monthPicker')
	const yearPicker = $('#yearPicker'), date = new Date().getFullYear()

	for(let i = date ; i < date + 100 ; ++i)
		yearPicker.append(`<option>${i}</option>`)

	for(let i = 1 ; i < 13 ; ++i)
		monthPicker.append(`<option>${i}</option>`)

	let cities = ['kolkata', 'Durgapur', 'Asansol', 'Siliguri']

	// const choose20 = $('.choose-20')
	// console.log(choose20)

	// for(let i = 1 ; i < 21 ; ++i)
	// 	choose20.append(`<option>${i}</option>`)

	// // choose20.change(function() {
	// // 	console.log(choose20.val())
	// // 	$.ajax({
	// // 		// url: '/line_items/choose/update_quantity'
	// // 	})
	// // })

	// option_changed = (element, id) => {
	// 	let val = element.value

	// 	$.ajax({
	// 		url: `/line_items/${id}/update_quantity/?q=#{val}`,
	// 		type: 'PATCH'
	// 	})
	// }
})
