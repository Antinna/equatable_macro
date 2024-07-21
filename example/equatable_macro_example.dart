import 'package:equatable_macro/equatable_macro.dart';

void main() {
  var a = Example(1, 'Alice');
  var b = Example(1, 'Alice');
  var c = Example(2, 'Bob');

  print(a == b); // true
  print(a == c); // false
  print(a.hashCode); // Unique hashCode based on fields
  print(b.hashCode); // Same hashCode as 'a'
  print(c.hashCode); // Different hashCode from 'a' and 'b'

  print(a); // Example(id: 1, name: Alice)
  print(b); // Example(id: 1, name: Alice)
  print(c); // Example(id: 2, name: Bob)
}

@Equatable(stringify: true)
class Example {
  final int id;
  final String name;

  const Example(this.id, this.name);
}
