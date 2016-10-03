csp = require 'js-csp'

player = (name, table) ->
  loop
    ball = yield csp.take table
    if ball is csp.CLOSED
      console.log name + ": table's gone"
      return
    ball.hits += 1
    console.log name + " " + ball.hits
    yield csp.timeout 100
    yield csp.put table, ball

# passed
# csp.go ->
#   table = csp.chan()
#
#   csp.go player, ['ping', table]
#   csp.go player, ['pong', table]
#
#   yield csp.put(table, {hits: 0})
#   yield csp.timeout 1000
#   table.close()

ch = csp.chan(1)

csp.go ->
  yield csp.timeout 1000
  yield csp.put ch, 42

csp.go ->
  timeCancle = csp.timeout 1500
  ret = yield csp.alts [ch, timeCancle]
  if ret.channel is timeCancle
    console.log 'time-out'
  else
    v = ret.value
    console.log 'not-time-out'
    console.log ret
  # switch ret
  #   when timeCancle
  #     console.log 'time out'
  #   else
  #     yield csp.take ch
