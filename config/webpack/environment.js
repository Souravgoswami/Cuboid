const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
	$: 'jquery',
	jQuery: 'jquery',
	// $: 'jquery/src/jquery',
	jQ: 'jquery/src/jquery',
	Popper: ['popper.js', 'default']
}))

module.exports = environment
