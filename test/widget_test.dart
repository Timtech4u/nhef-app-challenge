import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nhef/main.dart';
import 'package:nhef/pages/events.dart';
import 'package:nhef/pages/jobs.dart';
import 'package:nhef/pages/library.dart';
import 'package:nhef/pages/news.dart';
import 'package:nhef/pages/scholars.dart';
import 'package:nhef/pages/testimonial.dart';
import 'package:nhef/pages/universities.dart';

// Keep the real HTTP package and JSON rendering, redirecting only the socket to
// a local fixture server. No requests reach the production API.
class _DirectOverrides extends HttpOverrides {}

class _LocalClient extends Fake implements HttpClient {
  final HttpClient delegate;
  final int port;
  final List<Uri> requests;
  _LocalClient(this.delegate, this.port, this.requests);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) {
    expect(method, 'GET');
    requests.add(url);
    return delegate.openUrl(
      method,
      url.replace(scheme: 'http', host: '127.0.0.1', port: port),
    );
  }

  @override
  void close({bool force = false}) => delegate.close(force: force);
}

void main() {
  testWidgets('splash opens the alumni home screen', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(MyApp());
    expect(find.text('NHEF'), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('NHEF Alumni App'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  final pages = <String, Widget Function()>{
    'event': () => EventsDisplay(),
    'opportunity': () => JobListing(),
    'resource': () => LibraryResource(),
    'news': () => NewsListing(),
    'scholar': () => Scholars(),
    'testimonial': () => TestimonialListing(),
    'university': () => UniversityListing(),
  };

  for (final entry in pages.entries) {
    testWidgets('${entry.key} fetches and displays API data', (tester) async {
      final requests = <Uri>[];
      final namePage =
          ['scholar', 'testimonial', 'university'].contains(entry.key);
      final result = find.text(namePage ? 'Fixture name' : 'Fixture title');
      await tester.runAsync(() async {
        final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
        final served = Completer<void>();
        server.listen((request) async {
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode([
            {
              'id': 1,
              'title': 'Fixture title',
              'name': 'Fixture name',
              'detail':
                  'Fixture description with enough context for the existing preview.',
              'location': 'Kigali',
              'datetime': '2026-10-25',
              'opportunity_type': 'Internship',
              'company': 'Fixture company',
              'date_posted': '2026-10-25',
              'school': 'Fixture school',
              'email': 'fixture@example.invalid',
              'phone': '000',
              'scholar_year': '2026',
              'date_added': '2026-10-25',
              'author': 'Fixture author',
              'url': 'https://example.invalid/resource',
            }
          ]));
          await request.response.close();
          if (!served.isCompleted) served.complete();
        });
        // HttpOverrides() bypasses the widget test binding's network stub.
        final realClient = _DirectOverrides().createHttpClient(null);
        try {
          await HttpOverrides.runZoned(() async {
            await tester.pumpWidget(MaterialApp(home: entry.value()));
            await served.future.timeout(const Duration(seconds: 5));
            // Wait for the socket response and the resulting UI, without
            // assuming a fixed response time on the test machine.
            final deadline = DateTime.now().add(const Duration(seconds: 5));
            while (result.evaluate().isEmpty &&
                DateTime.now().isBefore(deadline)) {
              await Future<void>.delayed(const Duration(milliseconds: 10));
              await tester.pump();
            }
          },
              createHttpClient: (_) =>
                  _LocalClient(realClient, server.port, requests));
          await tester.pump();
          expect(requests,
              [Uri.parse('https://nhef.herokuapp.com/api/v1/${entry.key}/')]);
          expect(result, findsOneWidget);
          expect(tester.takeException(), isNull);
        } finally {
          realClient.close(force: true);
          await server.close(force: true);
        }
      });
    });
  }
}
