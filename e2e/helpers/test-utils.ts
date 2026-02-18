import * as fs from "fs";

function readCaseDataFile(path: string): string | null {
  try {
    return fs.readFileSync(path, "utf8").toString();
  } catch (error) {
    return null;
  }
}

function detectEnvironment(): string {
  const explicitEnv = (process.env.TEST_ENVIRONMENT || process.env.TEST_DATA_ENV || "").toLowerCase();
  if (explicitEnv) {
    return explicitEnv;
  }

  const webUrl = (process.env.TEST_E2E_URL_WEB || "").toLowerCase();
  if (webUrl.includes(".demo.")) {
    return "demo";
  }
  if (webUrl.includes(".aat.")) {
    return "aat";
  }

  return "";
}

export function getCaseDataJsonFromFile(fileName: string): string {
  const env = detectEnvironment();
  if (!env) {
    throw new Error(`Could not detect TEST_ENVIRONMENT for case data file: ${fileName}`);
  }

  const envFileName = fileName.replace(/\.json$/, `.${env}.json`);
  const candidatePaths = [
    process.cwd() + `/e2e/data/${envFileName}`,
    process.cwd() + `/data/${envFileName}`
  ];

  for (const path of candidatePaths) {
    const data = readCaseDataFile(path);
    if (data !== null) {
      return data;
    }
  }

  throw new Error(`Could not load case data file: ${fileName}`);
}
