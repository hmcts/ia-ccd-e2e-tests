type TestCounter = {
  totalTests: string[];
  passedTests: string[];
  addToTotalTests(testName: string): void;
  addToPassedTests(testName: string): void;
};
const testCounter: TestCounter = {
  totalTests: [],
  passedTests: [],
  addToTotalTests(testName: string) {
    if (!this.totalTests.includes(testName)) {
      console.log(`Adding scenario to total list of tests`);
      this.totalTests.push(testName);
    }
  },
  addToPassedTests(testName: string) {
    console.log(`Adding scenario to passed list of tests`);
    this.passedTests.push(testName);
  }
};

export { testCounter };
