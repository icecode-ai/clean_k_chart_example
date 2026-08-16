# clean_k_chart_example

Example app for the `clean_k_chart` package (workspace sibling `modules/clean_k_chart`). Currently just the default Flutter counter template — does not yet depend on or demo the chart package.

## Commands

```bash
flutter pub get
flutter run          # run the app (android/ios platforms included)
flutter analyze      # lint (flutter_lints ^6.0.0)
flutter test         # run tests (no test/ dir yet)
```

## Notes

- Single entrypoint: `lib/main.dart`
- When wiring up the chart demo, depend on `clean_k_chart` via path or git dependency
