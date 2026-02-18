# ServiceTitan Project Cost Diff Web App

A lightweight browser app to compare two versions of the same ServiceTitan report exported as Excel files.

## Required report columns

The app expects these exact columns (header spacing/casing can vary):

1. `ProjectId`
2. `TD Total Cost`
3. `TD Vendor Bill Cost`
4. `TD Labor Cost`
5. `TD Burden Cost`
6. `TD Invoice Equipment Cost`
7. `TD Invoice Material Cost`
8. `TD Payroll Adjustments`
9. `TD Vendor Return`

## What it shows

### 1) High-level overview

- Whether all `ProjectId` values are present in both reports
- Counts for:
  - matching `ProjectId` rows
  - missing in old report
  - missing in new report
- Per-column diff totals (for matching `ProjectId` rows), including:
  - **Total TD Total Cost diffs**
  - and the same metric for each other cost bucket

Overview cards are green when the metric is zero (or all IDs are matched) and red when non-zero.

### 2) Data tab

One row per matching `ProjectId`, with consolidated columns:

- `<Cost Bucket> (Old)`
- `<Cost Bucket> (New)`
- `<Cost Bucket> (Diff)` where **Diff = New - Old**

Also includes a `Diff Found` flag and a filter toggle:

- `All`
- `Diffs Only`

### 3) ProjectId presence mismatches tab

A dedicated tab showing only `ProjectId` values missing from either report.

## Run locally

```bash
python3 -m http.server 4173
```

Open <http://localhost:4173>
