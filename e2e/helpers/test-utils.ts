import * as fs from "fs";

export function getCaseDataJsonFromFile(fileName: string): string {
  let caseDataStr: string;
  try {
    caseDataStr = fs
      .readFileSync(process.cwd() + `/e2e/data/${fileName}`, 'utf8').toString();
  } catch (error) {
    caseDataStr = fs
      .readFileSync(process.cwd() + `/data/${fileName}`, 'utf8').toString();
  }
  return caseDataStr;
}
