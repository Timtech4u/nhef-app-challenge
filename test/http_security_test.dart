import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('HTTP methods cannot inject headers', () {
    expect(
      () => http.Request(
        'GET\r\nX-Injected: true',
        Uri.parse('https://example.invalid/'),
      ),
      throwsArgumentError,
    );
  });
}
