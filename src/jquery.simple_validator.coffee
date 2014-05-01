class window.SimpleValidator

  validateNumeric:(input)->
    return false if @isBlank(input)
    !isNaN(parseFloat(input)) and isFinite(input)

  validateLength:(input, minLength, maxLength)->
    return false if @isBlank(input)
    input = "" + input
    input.length > minLength and input.length < maxLength

  validateEmail:(input)->
    return false if @isBlank(input)
    re = /@/
    re.test(input)

  isBlank:(input)->
    return true if input is null or input is undefined

do ($ = jQuery, window, document) ->

	pluginName = "simpleValidator"
	defaults =
		property: "value"

	class Plugin
		constructor: (@element, options) ->
			@options = $.extend {}, defaults, options
			@_defaults = defaults
			@_name = pluginName
			@validator = new SimpleValidator()
			$(@element).submit() if @parseInputs()

		parseInputs:->
			valid = true
			id = $(@element).attr("id")
			inputs = $("#" + id + " :input")
			for input in inputs
				if $(input).data("validate") isnt null
					validation = $(input).data("validate")
					valid = valid and @validator.validateNumeric($(input).val()) if validation is "numeric"
					valid = valid and @validator.validateLength($(input).val(), $(input).data("minlength"), $(input).data("maxlength")) if validation is "length"
					valid = valid and @validator.validateEmail($(input).val()) if validation is "email"
			valid

	$.fn[pluginName] = (options) ->
		new Plugin(@, options)
