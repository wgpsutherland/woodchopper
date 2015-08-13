# NODE MODULES

_ = require('underscore');
flagger = require('flagger')();

# SETUP

flag = flagger.print or flagger.p # '-(-)print' takes precedence over '-(-)p'

# FUNCTIONS

matchKey = (keys) ->
  if typeof keys is 'string' then return _.contains(flag, keys)
  _.any keys, (key) ->
    _.contains(flag, key)

check = (keyString) ->
  flag and (flag.length is 0 or matchKey(keyString))

# EXPORT

module.exports =
  log: (keyString) ->
    if check(keyString)
      logArguments = Array.prototype.slice.call(arguments, 1)
      console.log.apply(console, logArguments)