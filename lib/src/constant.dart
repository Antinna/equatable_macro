import 'package:collection/collection.dart' show DeepCollectionEquality;

// final dartCore = Uri.parse('dart:core');

final uri = Uri.parse('package:equatable_macro/src/constant.dart');
// final collectionPackage = Uri.parse('package:collection/src/equality.dart');
final deepEquals = const DeepCollectionEquality().equals; //keep it here

