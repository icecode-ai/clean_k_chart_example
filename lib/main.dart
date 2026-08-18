import 'dart:math';

import 'package:clean_k_chart/clean_k_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clean_k_chart example',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late final List<KLineEntity> _data;

  final List<MainIndicator> _mainIndicators = [MAIndicator(), EMAIndicator()];
  final List<SecondaryIndicator> _secondaryIndicators = [
    MACDIndicator(),
    KDJIndicator(),
  ];

  @override
  void initState() {
    super.initState();
    _data = _generateData(count: 180);
    IndicatorCalculator.calculateAll(
      _data,
      _mainIndicators,
      _secondaryIndicators,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('clean_k_chart demo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 480,
              child: KChartWidget(
                data: _data,
                mainIndicators: _mainIndicators,
                secondaryIndicators: _secondaryIndicators,
                detailBuilder: (entity) => _buildDetail(entity),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 240,
              child: DepthChart(
                bids: _generateDepths(true),
                asks: _generateDepths(false),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(KLineEntity entity) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'O ${entity.open}  H ${entity.high}\n'
        'L ${entity.low}  C ${entity.close}\n'
        'VOL ${entity.vol.toStringAsFixed(2)}',
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}

List<KLineEntity> _generateData({int count = 180}) {
  final random = Random(7);
  final data = <KLineEntity>[];
  var price = 100.0;
  final start = DateTime(2026, 5, 1);
  for (var i = 0; i < count; i++) {
    final change = (random.nextDouble() - 0.48) * 4;
    final open = price;
    final close = (open + change).clamp(1, 1000).toDouble();
    final high = max(open, close) + random.nextDouble() * 1.5;
    final low = min(open, close) - random.nextDouble() * 1.5;
    price = close;
    data.add(
      KLineEntity(
        time: start.millisecondsSinceEpoch + i * 60 * 60 * 1000,
        open: open,
        high: high,
        low: low,
        close: close,
        vol: 500 + random.nextDouble() * 2000,
      ),
    );
  }
  return data;
}

List<DepthEntity> _generateDepths(bool isBuy) {
  final random = Random(3);
  final base = isBuy ? 99.0 : 101.0;
  return List.generate(40, (i) {
    final price = isBuy ? base - i * 0.08 : base + i * 0.08;
    final vol = 800 * pow(0.97, i) + random.nextDouble() * 60;
    return DepthEntity(price, vol);
  });
}
