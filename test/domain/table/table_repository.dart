import 'package:dinner_app/domain/table/table_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('', () async {
    final repository = TableRepository();

    await repository.delete(0);
  });
}
