import 'dart:async';
import 'package:macros/macros.dart';
import 'constant.dart';
// import 'hashing.dart' ;






// import 'dart:core' as prefix0;

// augment abstract class Class {
// external prefix0.bool operator==(prefix0.Object other);
// external prefix0.int get hashCode;
// }
// augment class NewClass {
// external prefix0.bool operator==(prefix0.Object other);
// external prefix0.int get hashCode;
// }





extension IterableExtensionX<T> on Iterable<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

}

macro class Equatable implements ClassDeclarationsMacro, ClassDefinitionMacro {
  final bool stringify;
  const Equatable({this.stringify = false});
  

   MethodDeclaration? equality(List<MethodDeclaration> methods ,String op) {
    return
     methods.firstWhereOrNull(
      (m) => m.identifier.name == op,
    );
    // if (equality == null) return;
  }
  
  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder)async {
    final object = await builder.resolveIdentifier(Uri.parse('dart:core'), 'Object');
    final boolean = await  builder.resolveIdentifier(Uri.parse('dart:core'), 'bool');
      final integer = await builder.resolveIdentifier(Uri.parse('dart:core'), 'int');
      final string = await builder.resolveIdentifier(Uri.parse('dart:core'), 'String');

    return builder.declareInType(DeclarationCode.fromParts(['  external ', boolean, ' operator==(', object, ' other);\n',
    '  external ', integer, ' get hashCode;\n', //if nothing in fields then hash code will be 0
    if (stringify) ...['  external ', string, ' toString();'],

    ]));
  }
  
  @override
  Future<void> buildDefinitionForClass(ClassDeclaration clazz, TypeDefinitionBuilder builder) async {

 final methods = await builder.methodsOf(clazz);

final deepEquals   = await  builder.resolveIdentifier(uri, 'deepEquals');
final identical    = await builder.resolveIdentifier(Uri.parse('dart:core'), 'identical');
final object    = await builder.resolveIdentifier(Uri.parse('dart:core'), 'Object');  
// final hashAll = await builder.resolveIdentifier(hashingPackage, 'hashAll');
final equalsMethod = (equality(methods,"==") == null)? null :await  builder.buildMethod(equality(methods,"==")!.identifier);
final hashCodeMethod =  (equality(methods,'hashCode') == null)? null :await   builder.buildMethod(equality(methods,'hashCode')!.identifier);
 final toStringMethod =  (equality(methods,'toString') == null)? null :await   builder.buildMethod(equality(methods,'toString')!.identifier);
 var allFields = <FieldDeclaration>[];
 superclassOf(ClassDeclaration clazz) async {  final superclassType = clazz.superclass != null
      ? await builder.typeDeclarationOf( clazz.superclass!.identifier): null;
        return superclassType is ClassDeclaration ? superclassType : null;
       }
 /// Returns a string for [props].



////////////////////////////
allFields.addAll(await builder.fieldsOf(clazz));
 var superclass = await superclassOf(clazz);

while (superclass != null && superclass.identifier.name != 'Object') {
  allFields.addAll(await builder.fieldsOf(superclass));
  superclass = await superclassOf(superclass);
}
allFields = allFields..removeWhere((f) => f.hasStatic); //! todo:  modify in future
final fields       = allFields;
final fieldNames = fields.map((f) => f.identifier.name); //error here
final lastField = fieldNames.lastOrNull; //error here most
final toStringFields = fields.map((field) {
      return '${field.type.isNullable ? 'if (${field.identifier.name} != null)' : ''} "${field.identifier.name}: \${${field.identifier.name}.toString()}", ';
    });
if (stringify) {

  toStringMethod?.augment(FunctionBodyCode.fromParts([ '=> "',
          clazz.identifier.name,
          '(\${[',
          ...toStringFields,
          '].join(", ")})',
          '";',]));
}
 // if only this part 
   if (fields.isEmpty || lastField == null) {
       equalsMethod?.augment(
        FunctionBodyCode.fromParts(
          [
            '{\n',
            '    if (', identical,' (this, other)',')', 'return true;\n',
            '     return other is ${clazz.identifier.name} && \n',
            '      other.runtimeType == runtimeType;\n',
            '  }\n',
          ],
        ),      
      );
    }

   if (equalsMethod ==null ||hashCodeMethod == null) {
   return;
   }
    // else only this part  , try adding one part only
   if(lastField != null) {
     equalsMethod.augment(
      FunctionBodyCode.fromParts(
        [
           
          '{\n',
          '  if (', identical,' (this, other)',')', 'return true;\n',
          '    return other is ${clazz.identifier.name} && \n',
          '   other.runtimeType == runtimeType',
            ' && \n   ',
          for (final field in fieldNames)
           
            ...[deepEquals , '($field, other.$field)', if (field != lastField) ' && '], //that will give error here
          ';\n',
          '  }',
        ],
      ),      
    );
   }


    /////////////
    ///runtimeType.hashCode
   
    //  if(lastField != null) {
     hashCodeMethod.augment(
      FunctionBodyCode.fromParts(
        [
          '=> ',
          object,
          '.hashAll',
          '([',
          '${clazz.identifier.name},',
          fieldNames.join(', '),
          ']',
          
          ');',
        ],
      ),
    );
    //    hashCodeMethod.augment(
    //   FunctionBodyCode.fromParts(
    //     [
    //       '=> ',
    //       hashAll,
    //       '([',
    //       fieldNames.join(', '),
    //       ']',
    //       ',clazzIdentifier: ${clazz.identifier.name}'
    //       ');',
    //     ],
    //   ),
    // );
  //    } 
  //    else 
  //    {
  //    hashCodeMethod.augment(
  //     FunctionBodyCode.fromParts(
  //       [
  //         '=> ',
  //         'runtimeType.hashCode'
  //         ';',
  //       ],
  //     ),
  //   );
  // }
   
}

}