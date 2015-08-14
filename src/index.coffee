#==================== NODE MODULES =====================#

flagger = require('flagger')();

#==================== SETUP ============================#

flag = flagger.print or flagger.p # '-(-)print' takes precedence over '-(-)p'

#==================== FUNCTIONS ========================#

matchKey = (keys) ->
  if typeof keys is 'string' and keys in flag then return true
  return true for key in keys when key in flag

check = (keyString) -> flag and (flag.length is 0 or matchKey(keyString))

call = (func, keyString, toPrint...) -> if check(keyString) then console[func] toPrint...

#==================== EXPORT ===========================#

module.exports =
  assert:         (args...) -> call('assert', args...)
  count:          (args...) -> call('count', args...)
  debug:          (args...) -> call('debug', args...)
  dir:            (args...) -> call('dir', args...)
  dirxml:         (args...) -> call('dirxml', args...)
  error:          (args...) -> call('error', args...)
  _exception:     (args...) -> call('_exception', args...)
  group:          (args...) -> call('group', args...)
  groupCollapsed: (args...) -> call('groupCollapsed', args...)
  groupEnd:       (args...) -> call('groupEnd', args...)
  info:           (args...) -> call('info', args...)
  log:            (args...) -> call('log', args...)
  profile:        (args...) -> call('profile', args...)
  profileEnd:     (args...) -> call('profileEnd', args...)
  table:          (args...) -> call('table', args...)
  time:           (args...) -> call('time', args...)
  timeEnd:        (args...) -> call('timeEnd', args...)
  timeStamp:      (args...) -> call('timeStamp', args...)
  trace:          (args...) -> call('trace', args...)
  warn:           (args...) -> call('warn', args...)
