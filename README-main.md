
<!-- Pre-release Version: -->
<!-- README-main.md -->


# equatable_macro (Pre-release: 0.0.1-main.1)

A Dart package providing a macro to automatically make classes equatable, inspired by the `equatable` package. This is a pre-release version and may contain experimental features.

## Features

- Automatically implements equality and hashCode for your classes.
- Easy to use with minimal boilerplate.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  equatable_macro: ^0.0.1-main.1
```
## Usage
Import the package and use the `@Equatable` annotation:
```dart
import 'package:equatable_macro/equatable_macro.dart';

@Equatable() //or @Equatable(stringify: true)
class Example {
  final int id;
  final String name;

  const Example(this.id, this.name);
}

```
## Example
```dart
import 'package:equatable_macro/equatable_macro.dart';

void main() {
  var a = Example(1, 'a');
  var b = Example(1, 'a');
  var c = Example(2, 'b');

  print(a == b); // true
  print(a == c); // false
}

@Equatable() //or @Equatable(stringify: true)
class Example {
  final int id;
  final String name;

  const Example(this.id, this.name);
}

```

## Benchmarks

Benchmarks for this package are yet to be added. Stay tuned for updates.

## Special Thanks

- Remi Rousselet (creator of the provider package): [@rrousselGit](https://github.com/rrousselGit)
- Felix Angelov (creator of the bloc package): [@felangel](https://github.com/felangel)
- Simon Lightfoot: [@slightfoot](https://github.com/slightfoot)
- Dane Mackier: [@FilledStacks](https://github.com/FilledStacks)
