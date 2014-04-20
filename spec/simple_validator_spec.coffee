describe 'simpleValidator', ->
  beforeEach ->
    @simpleValidator = new SimpleValidator()
  
  it 'validates nil', ->
    expect(@simpleValidator.validateNumeric(null)).toBe(false)

  it 'validates undefined', ->
    expect(@simpleValidator.validateNumeric(undefined)).toBe(false)

  it 'validates numeric input', ->
    expect(@simpleValidator.validateNumeric(5)).toBe(true)

  it 'validates numeric input - 2', ->
    expect(@simpleValidator.validateNumeric(5.5)).toBe(true)

  it 'invalidates non-numeric input', ->
    expect(@simpleValidator.validateNumeric("a")).toBe(false)

  it 'invalidates non-numeric input - 2', ->
    expect(@simpleValidator.validateNumeric(" ")).toBe(false)

  it 'validates input length', ->
    expect(@simpleValidator.validateLength("abcd", 3, 10)).toBe(true)

  it 'validates input length - 2', ->
    expect(@simpleValidator.validateLength("abcde", 3, 4)).toBe(false)

  it 'validates email', ->
    expect(@simpleValidator.validateEmail("abcddef")).toBe(false)

  it 'validates email - 2', ->
    expect(@simpleValidator.validateEmail("abcd@def")).toBe(true)