import 'package:equatable_macro/equatable_macro.dart';

void main() {
  var a = Example(id: 1, name: 'Alice');
  var b = Example(id: 1, name: 'Alice');
  var c = Example(id: 2, name: 'Bob');

  print(a == b); // true
  print(a == c); // false
  print(a.hashCode); // Unique hashCode based on fields and Example
  print(b.hashCode); // Same hashCode as 'a'
  print(c.hashCode); // Different hashCode from 'a' and 'b'

  print(a); // Example(id: 1, name: Alice)
  print(b); // Example(id: 1, name: Alice)
  print(c); // Example(id: 2, name: Bob)
  Set set = {a, b, c};
  print(set); //{Example(id: 1, name: Alice), Example(id: 2, name: Bob)}
}

// @Equatable(stringify: true)
class Example {
  final int? id;
  final String? name;

  const Example({this.id, this.name});
}
