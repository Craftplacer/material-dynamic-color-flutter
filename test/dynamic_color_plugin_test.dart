import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:dynamic_color/test_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getCorePalette', () async {
    final sampleFromListCorePalette = generateCorePalette((i) => i);

    DynamicColorTestingUtils.setMockDynamicColors(
      colorPalette: sampleFromListCorePalette,
    );
    final colors = await DynamicColorPlugin.getCorePalette();
    expect(colors, sampleFromListCorePalette);
  });

  test('getCorePalette returns null', () async {
    DynamicColorTestingUtils.setMockDynamicColors(
      colorPalette: null,
    );
    final colors = await DynamicColorPlugin.getCorePalette();
    expect(colors, equals(null));
  });

  test('getControlAccentColor', () async {
    const color = Color.fromARGB(12, 24, 123, 53);

    DynamicColorTestingUtils.setMockDynamicColors(
      controlAccentColor: color,
    );
    final result = await DynamicColorPlugin.getControlAccentColor();
    expect(result, color);
  });

  test('getControlAccentColor returns null', () async {
    DynamicColorTestingUtils.setMockDynamicColors(controlAccentColor: null);

    final colors = await DynamicColorPlugin.getControlAccentColor();
    expect(colors, equals(null));
  });
}
