# clean_k_chart_example

Example app for the `clean_k_chart` package. `lib/main.dart` renders a
demo screen with a `KChartWidget` (MA/EMA main indicators + MACD/KDJ
secondary indicators, generated sample data) and a `DepthChart`; the
package is wired as a path dependency.

## Commands

- `flutter pub get` — fetch dependencies
- `flutter run` — run app (Android/iOS platforms only)
- `flutter analyze` — static analysis (flutter_lints ^6.0.0 via `analysis_options.yaml`); must report **0 issues**
- `dart format .` — formatting
- `flutter test` — no `test/` dir yet

## Notes

- Sample data is generated locally (`_generateData` / `_generateDepths` in
  `lib/main.dart`) and passed through `IndicatorCalculator.calculateAll`
  before being handed to `KChartWidget` — that is the package's data
  contract.
- The package dependency uses a relative path:
  ```yaml
  dependencies:
    clean_k_chart:
      path: ../clean_k_chart
  ```
