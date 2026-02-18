# ServiceTitan Report Diff Web App

A lightweight browser-based app to compare two versions of the same ServiceTitan report exported as Excel files.

## What it does

- Accepts two `.xlsx/.xls` files via drag-and-drop.
- Assumes the report has exactly 9 columns:
  - Column 1 = key column
  - Columns 2-9 = value columns
- Produces row-level diff output for each value column:
  - `old` value
  - `new` value
  - `diff` value (numeric subtraction if both are numeric)
- Highlights added, removed, and changed rows.
- Lets you export the diff report as CSV or XLSX.

## Run locally

Because the app is fully client-side, any static file server works:

```bash
python3 -m http.server 4173
```

Then open: <http://localhost:4173>

## Notes

- The app compares rows by the first column (key).
- Non-numeric values are shown as `old → new` in the diff column if changed.
- If both values are numeric, diff is calculated as `new - old`.
