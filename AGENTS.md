# clean_k_chart_example

Example app for the `clean_k_chart` package. Currently the unmodified Flutter counter template (`lib/main.dart`); the chart demo is not yet wired and `pubspec.yaml` does not yet depend on `clean_k_chart`.

## Commands

- `flutter pub get` — fetch dependencies
- `flutter run` — run app (Android/iOS platforms only)
- `flutter analyze` — static analysis (flutter_lints ^6.0.0 via `analysis_options.yaml`)
- `dart format .` — formatting
- `flutter test` — no `test/` dir yet

## Wiring the chart demo

- Add a path dependency to use the local package:
  ```yaml
  dependencies:
    clean_k_chart:
      path: ../clean_k_chart
  ```
- Import via `package:clean_k_chart/clean_k_chart.dart`
