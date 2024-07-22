import 'package:equatable_macro/equatable_macro.dart';
import 'package:test/test.dart';

void main() {
  group('@Equatable Macro Tests', () {
    test('@Equatable equality test', () {
      var a = MacroEquatableExample(1, 'a');
      var b = MacroEquatableExample(1, 'a');
      expect(a == b, isTrue);
    });

    test('@Equatable non-equality test', () {
      var a = MacroEquatableExample(1, 'a');
      var b = MacroEquatableExample(2, 'b');
      expect(a == b, isFalse);
    });

    test('@Equatable list test', () {
      var list1 = [
        MacroEquatableExample(1, 'a'),
        MacroEquatableExample(2, 'b')
      ];
      var list2 = [
        MacroEquatableExample(1, 'a'),
        MacroEquatableExample(2, 'b')
      ];
      expect(list1, equals(list2));
    });

    test('@Equatable map test', () {
      var map1 = {
        MacroEquatableExample(1, 'a'): 'value1',
        MacroEquatableExample(2, 'b'): 'value2'
      };
      var map2 = {
        MacroEquatableExample(1, 'a'): 'value1',
        MacroEquatableExample(2, 'b'): 'value2'
      };
      expect(map1, equals(map2));
    });
  });
}

// @Equatable(stringify: true)
class MacroEquatableExample {
  final int id;
  final String name;

  const MacroEquatableExample(this.id, this.name);
}
