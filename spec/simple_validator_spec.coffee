describe 'simpleValidator', ->
  beforeEach ->
    @simpleValidator = new SimpleValidator()
  
  it 'validates nil', ->
    expect(@simpleValidator.validateNumeric(null)).toBe(false)

  it 'validates undefined', ->
    expect(@simpleValidator.validateNumeric(undefined)).toBe(false)

  it 'validates numeric input', ->
    expect(@simpleValidator.validateNumeric(5)).toBe(true)

  it 'validates numeric input (float)', ->
    expect(@simpleValidator.validateNumeric(5.5)).toBe(true)

  it 'invalidates numeric input (blanks)', ->
    expect(@simpleValidator.validateNumeric(" ")).toBe(false)

  it 'invalidates non-numeric input', ->
    expect(@simpleValidator.validateNumeric("a")).toBe(false)

  it 'invalidates non-numeric input (blanks)', ->
    expect(@simpleValidator.validateNumeric(" ")).toBe(false)

  it 'validates input length', ->
    expect(@simpleValidator.validateLength("abcd", 3, 10)).toBe(true)

  it 'validates input length (more than max)', ->
    expect(@simpleValidator.validateLength("abcde", 3, 4)).toBe(false)

  it 'invalidates bad email', ->
    expect(@simpleValidator.validateEmail("abcddef")).toBe(false)

  it 'validates right email', ->
    expect(@simpleValidator.validateEmail("abcd@def")).toBe(true)
