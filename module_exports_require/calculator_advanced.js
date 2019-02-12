const BaseCalculator = require('./calculator_base.js')

class AdvancedCalculator extends BaseCalculator {
  multiply(a,b) { return a * b }
  divide(a,b) { return a / b }
}

module.exports = new AdvancedCalculator()
