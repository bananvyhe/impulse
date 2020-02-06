const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')
const vue =  require('./loaders/vue')
const post =  require('./loaders/post')

environment.loaders.append('vue', vue)
environment.loaders.append('erb', erb)
environment.loaders.append('post', post)
module.exports = environment
