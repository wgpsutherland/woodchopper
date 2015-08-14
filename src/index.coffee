###
  NODE MODULES
###

flagger = require('flagger')();

###
  SETUP
###

flag = flagger.print or flagger.p  # '-(-)print' takes precedence over '-(-)p'

###
  FUNCTIONS
###

matchKey = (keys) ->
  if typeof keys is 'string' and keys in flag then return true
  return true for key in keys when key in flag

check = (keyString) -> flag and (flag.length is 0 or matchKey(keyString))

###
  EXPORT
###

module.exports =
  log: (keyString, toPrint...) -> if check(keyString) then console.log toPrint...