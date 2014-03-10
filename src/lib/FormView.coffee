View = require('ryggrad').View

class FormView extends View
  initFormWithAttributeValues: ->
    for attr, value of @attributes()
      field = @[field]
      if field
        field.val(value)

  invalidate: ->
    for validation in @invalidations()
      @invalidateField(validation.property, validation.message)

  invalidateField: (field, message) ->
    field = @[field]
    if field
      field.closest('.control-group').addClass('error')
      field.siblings('.help-inline').text(message)

module.exports = FormView
