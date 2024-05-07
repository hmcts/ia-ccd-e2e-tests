const fs = require('fs');
const path = require('path');

// Function to recursively search for .feature files in a directory
function findFeatureFiles(directory, fileList) {
  const files = fs.readdirSync(directory);
  fileList = fileList || [];

  files.forEach((file) => {
    const filePath = path.join(directory, file);
    const stat = fs.statSync(filePath);
    if (stat.isDirectory()) {
      findFeatureFiles(filePath, fileList);
    } else if (filePath.endsWith('.feature')) {
      fileList.push(filePath);
    }
  });

  return fileList;
}

// Function to search for a specific tag in a file
function searchForTag(filePath, tag) {
  const results = new Set();
  const fileStream = fs.createReadStream(filePath);
  const rl = require('readline').createInterface({
    input: fileStream,
    crlfDelay: Infinity,
  });

  const regex = new RegExp(`(?:^|\\s)${tag}(?:\\s|$)`);

  rl.on('line', (line) => {
    if (regex.test(line)) {
      results.add(`${filePath.replace('e2e', '.')}`);
    }
  });

  return new Promise((resolve, reject) => {
    rl.on('close', () => {
      resolve(results);
    });
    rl.on('error', (err) => {
      reject(err);
    });
  });
}

// Main function to search all .feature files for a specific tag
async function main() {
  // Extract the cucumberTag from command-line arguments
  const args = process.argv.slice(2);
  if (args.length !== 1) {
    console.error('Usage: node cucumberTagSearcher.js <cucumberTag>');
    process.exit(1);
  }
  const cucumberTag = args[0];

  const featureFiles = findFeatureFiles('e2e/features');
  const searchResults = [];

  for (const file of featureFiles) {
    const results = await searchForTag(file, cucumberTag);
    searchResults.push(...results);
  }

  const jsonResult = JSON.stringify(searchResults, null, 2);
  fs.writeFileSync('cucumberTaggedFiles.json', jsonResult);

  console.log('Results written to cucumberTaggedFiles.json');
  console.log('List of tests to run : ' + jsonResult);
}

main().catch((err) => {
  console.error('Error:', err);
});
