(function() {
  describe('simpleValidator', function() {
    beforeEach(function() {
      return this.simpleValidator = new SimpleValidator();
    });
    it('validates nil', function() {
      return expect(this.simpleValidator.validateNumeric(null)).toBe(false);
    });
    it('validates undefined', function() {
      return expect(this.simpleValidator.validateNumeric(void 0)).toBe(false);
    });
    it('validates numeric input', function() {
      return expect(this.simpleValidator.validateNumeric(5)).toBe(true);
    });
    it('validates numeric input - 2', function() {
      return expect(this.simpleValidator.validateNumeric(5.5)).toBe(true);
    });
    it('invalidates non-numeric input', function() {
      return expect(this.simpleValidator.validateNumeric("a")).toBe(false);
    });
    it('invalidates non-numeric input - 2', function() {
      return expect(this.simpleValidator.validateNumeric(" ")).toBe(false);
    });
    it('validates input length', function() {
      return expect(this.simpleValidator.validateLength("abcd", 3, 10)).toBe(true);
    });
    it('validates input length - 2', function() {
      return expect(this.simpleValidator.validateLength("abcde", 3, 4)).toBe(false);
    });
    it('validates email', function() {
      return expect(this.simpleValidator.validateEmail("abcddef")).toBe(false);
    });
    return it('validates email - 2', function() {
      return expect(this.simpleValidator.validateEmail("abcd@def")).toBe(true);
    });
  });

}).call(this);
