import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("GET /products returns 200 OK", () async {
    final response = await harness.agent.get("/products");

    expectResponse(response, 200);
  });
}
