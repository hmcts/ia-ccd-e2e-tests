const testCounter = {
  totalTests: [],
  passedTests: [],
  addToTotalTests(testName) {
    if (!this.totalTests.includes(testName)) {
      console.log(`Adding scenario to total list of tests`);
      this.totalTests.push(testName);
    }
  },
  addToPassedTests(testName) {
    console.log(`Adding scenario to passed list of tests`);
    this.passedTests.push(testName);
  }
};

module.exports = {
  testCounter: testCounter
};

