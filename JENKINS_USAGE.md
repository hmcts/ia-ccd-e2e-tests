# Jenkins Pipeline Configuration

This repository uses a single unified Jenkinsfile for all testing scenarios.

## Jenkinsfile: `Jenkinsfile_nightly`

**Purpose**: Unified pipeline for both scheduled nightly tests and manual branch/PR testing

**Features**:
- ✅ Scheduled automated runs on master branch (Mon-Fri at 8 AM)
- ✅ Manual runs on ANY branch or PR
- ✅ Run specific tagged tests (e.g., `@this-new-test-nish`)
- ✅ Run full test suites (Appeal, Bail, Cross-browser)
- ✅ Flexible configuration for different scenarios

---

## Parameters

### Core Parameters

| Parameter | Description | Default | Example |
|-----------|-------------|---------|---------|
| `BRANCH_TO_TEST` | 🔀 Branch or PR to test | `master` (or current branch) | `feature/my-branch`, `PR-123` |
| `SPECIFIC_TAGS` | 🏷️ Cucumber tag to run | Empty (runs full suites) | `@this-new-test-nish`, `@smoke` |

### Test Control Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `skipAppealFunctionalTests` | Skip appeal tests | `false` |
| `skipBailFunctionalTests` | Skip bail tests | `false` |
| `skipCrossBrowserTests` | Skip cross-browser tests | `false` |

### Environment Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `URL_TO_TEST` | URL to test against | `https://manage-case.aat.platform.hmcts.net` |
| `CCD_GATEWAY_URL` | CCD Gateway URL | `https://gateway-ccd.aat.platform.hmcts.net` |
| `NUM_TESTS_IN_PARALLEL` | Parallel test instances | `4` |
| `RETRIES` | Number of retries | `4` |

---

## Usage Scenarios

### 1. **Test Specific Tag on Your Branch/PR** ⭐ (Most Common)

**Use Case**: You want to test your new feature with a specific Cucumber tag

**Steps**:
1. Go to Jenkins job
2. Click **"Build with Parameters"**
3. Set parameters:
   ```
   BRANCH_TO_TEST: feature/your-branch-name  (or PR-123)
   SPECIFIC_TAGS: @this-new-test-nish
   skipAppealFunctionalTests: ☑ (checked)
   skipBailFunctionalTests: ☑ (checked)
   skipCrossBrowserTests: ☑ (checked)
   ```
4. Click **"Build"**

**What Happens**: Only tests with `@this-new-test-nish` tag will run on your branch

---

### 2. **Test Full Appeal Suite on Your Branch**

**Use Case**: Validate your changes against the complete appeal test suite

**Steps**:
1. Click **"Build with Parameters"**
2. Set parameters:
   ```
   BRANCH_TO_TEST: feature/your-branch-name
   SPECIFIC_TAGS: (leave empty)
   skipAppealFunctionalTests: ☐ (unchecked)
   skipBailFunctionalTests: ☑ (checked)
   skipCrossBrowserTests: ☑ (checked)
   ```
3. Click **"Build"**

---

### 3. **Test PR Before Merging**

**Use Case**: Run full validation on a PR

**Steps**:
1. Click **"Build with Parameters"**
2. Set parameters:
   ```
   BRANCH_TO_TEST: PR-456
   SPECIFIC_TAGS: (leave empty)
   skipAppealFunctionalTests: ☐
   skipBailFunctionalTests: ☐
   skipCrossBrowserTests: ☑
   ```
3. Click **"Build"**

---

### 4. **Quick Smoke Test on Any Branch**

**Use Case**: Fast validation with smoke tests only

**Steps**:
1. Click **"Build with Parameters"**
2. Set parameters:
   ```
   BRANCH_TO_TEST: your-branch-name
   SPECIFIC_TAGS: @smoke
   skipAppealFunctionalTests: ☑
   skipBailFunctionalTests: ☑
   skipCrossBrowserTests: ☑
   NUM_TESTS_IN_PARALLEL: 2
   RETRIES: 2
   ```
3. Click **"Build"**

---

### 5. **Scheduled Nightly Runs** (Automatic)

**Use Case**: Automated overnight testing on master

**Configuration**: Already configured - runs automatically Mon-Fri at 8 AM

**What Runs**:
- All appeal tests
- All bail tests  
- Cross-browser tests
- On master branch only

---

## Quick Reference Table

| Scenario | BRANCH_TO_TEST | SPECIFIC_TAGS | Skip Tests | When to Use |
|----------|----------------|---------------|------------|-------------|
| Test my tag on my branch | `feature/xyz` | `@my-tag` | All skipped | Developing new feature |
| Validate PR | `PR-123` | Empty | None skipped | Before merge |
| Quick check | Any branch | `@smoke` | All skipped | Fast feedback |
| Full appeal suite | Any branch | Empty | Bail & Cross skipped | Appeal changes |
| Nightly run | `master` | Empty | None skipped | Automatic (scheduled) |

---

## Real-World Examples

### Example 1: Testing Your New FTPA Feature
You've added `@this-new-test-nish` tag to your FTPA test and want to verify it works:

```yaml
BRANCH_TO_TEST: feature/ftpa-improvements
SPECIFIC_TAGS: @this-new-test-nish
skipAppealFunctionalTests: ☑
skipBailFunctionalTests: ☑
skipCrossBrowserTests: ☑
NUM_TESTS_IN_PARALLEL: 4
RETRIES: 4
```

**Result**: Only your tagged test runs, fast feedback (~10-20 min depending on test)

---

### Example 2: Pre-Merge PR Validation
PR #456 is ready to merge, run comprehensive tests:

```yaml
BRANCH_TO_TEST: PR-456
SPECIFIC_TAGS: (empty)
skipAppealFunctionalTests: ☐
skipBailFunctionalTests: ☐
skipCrossBrowserTests: ☑
NUM_TESTS_IN_PARALLEL: 4
RETRIES: 4
```

**Result**: Full appeal and bail suites run (~2-3 hours)

---

### Example 3: Debug Failing Test on Specific Branch
A test is failing on `develop` branch, need to investigate:

```yaml
BRANCH_TO_TEST: develop
SPECIFIC_TAGS: @RIA-2919
skipAppealFunctionalTests: ☑
skipBailFunctionalTests: ☑
skipCrossBrowserTests: ☑
NUM_TESTS_IN_PARALLEL: 1
RETRIES: 1
```

**Result**: Single test runs with minimal retries for faster debugging

---

## Tips & Best Practices

### 🚀 For Faster Feedback
- Use `SPECIFIC_TAGS` to run only relevant tests
- Skip unnecessary test suites
- Reduce `NUM_TESTS_IN_PARALLEL` and `RETRIES` for simpler tests

### 🎯 For Comprehensive Testing  
- Leave `SPECIFIC_TAGS` empty to run full suites
- Don't skip any test suites
- Use default parallel instances and retries

### 🔧 For Debugging
- Set `NUM_TESTS_IN_PARALLEL: 1` to avoid race conditions
- Set `RETRIES: 1` to fail fast
- Use specific tags to isolate failing tests

### ✅ Before Merging a PR
- Run on your PR branch: `BRANCH_TO_TEST: PR-XXX`
- Run full relevant test suite (Appeal or Bail)
- Don't skip tests related to your changes

---

## How It Works

### Scheduled Runs (Automatic)
- **Trigger**: Cron schedule `H 8 * * 1-5` (Weekdays at 8 AM)
- **Branch**: Master only
- **Tests**: All suites (Appeal + Bail + Cross-browser)
- **Configuration**: Uses default parameters

### Manual Runs (On-Demand)
- **Trigger**: Click "Build with Parameters" in Jenkins
- **Branch**: Any branch or PR you specify
- **Tests**: Configurable via parameters
- **Configuration**: You control what runs

### Branch Checkout Logic
1. If `BRANCH_TO_TEST` is set and different from current branch → checkout specified branch
2. If `BRANCH_TO_TEST` is empty or same as current → use current branch  
3. Pipeline logs show which branch is being tested

---

## Troubleshooting

### Q: My branch isn't being checked out
**A**: Make sure `BRANCH_TO_TEST` exactly matches your branch name. For PRs, use format `PR-123`

### Q: Tests are taking too long
**A**: Use `SPECIFIC_TAGS` to run only necessary tests, or reduce `NUM_TESTS_IN_PARALLEL`

### Q: All tests are running even though I set SPECIFIC_TAGS
**A**: Make sure `SPECIFIC_TAGS` is not empty. If set, it overrides skip parameters.

### Q: How do I test multiple tags?
**A**: Use Cucumber tag expressions: `@tag1,@tag2` (OR) or `@tag1 and @tag2` (AND)

---

## Environment Variables

The pipeline sets these environment variables:
- `TEST_E2E_URL_WEB`: URL to test against
- `TEST_E2E_URL_GATEWAY`: CCD Gateway URL  
- `TEST_E2E_NUM_BROWSERS`: Number of parallel browser instances
- `RETRIES`: Number of test retries
- `TEST_E2E_WAIT_FOR_ANGULAR`: Wait for Angular (default: false)
- `TEST_E2E_FAIL_FAST`: Fail fast on first error (default: false)

---

## Need Help?

- **For test tag issues**: Check `e2e/features/` for available tags
- **For Jenkins setup**: Contact DevOps team
- **For test failures**: Check the HTML reports in Jenkins artifacts
