import 'package:test/test.dart';
import 'package:equatable/equatable.dart';

void main() {
  group('Equatable Package Tests', () {
    test('Equatable equality test', () {
      var a = EquatableExample(1, 'a');
      var b = EquatableExample(1, 'a');
      expect(a == b, isTrue);
    });

    test('Equatable non-equality test', () {
      var a = EquatableExample(1, 'a');
      var b = EquatableExample(2, 'b');
      expect(a == b, isFalse);
    });

    test('Equatable list test', () {
      var list1 = [EquatableExample(1, 'a'), EquatableExample(2, 'b')];
      var list2 = [EquatableExample(1, 'a'), EquatableExample(2, 'b')];
      expect(list1, equals(list2));
    });

    test('Equatable map test', () {
      var map1 = {EquatableExample(1, 'a'): 'value1', EquatableExample(2, 'b'): 'value2'};
      var map2 = {EquatableExample(1, 'a'): 'value1', EquatableExample(2, 'b'): 'value2'};
      expect(map1, equals(map2));
    });
  });
}

class EquatableExample extends Equatable {
  final int id;
  final String name;

  EquatableExample(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}
