const { environment } = require('@rails/webpacker')

// Bootstrap 5 用の Popper.js
const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
