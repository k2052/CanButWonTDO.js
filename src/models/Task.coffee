Ryggrad = require('ryggrad')
TimeExt = require('../lib/TimeExt')

class Task extends Ryggrad.Model
	@include TimeExt
  
  @key "day_id", String
  @key "name",   String
  @key "done",   Boolean
  @key "body",   String
  @key "failed", Boolean

  @active: ->
    @filter (item) -> !item.done

  @done: ->
    @filter (item) -> !!item.done

  @destroyDone: ->
    rec.destroy() for rec in @done()

  @dayOfYear: ->
    @created_at.dayOfYear()

  @day: ->
    Day.findBy('day', @get('day_id'))

module.exports = Task
