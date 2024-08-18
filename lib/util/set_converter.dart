import 'dart:convert';

import 'package:drift/drift.dart';

class SetConverter extends TypeConverter<Set<String>, String> {
  const SetConverter();

  Set<String> mapToDart(String? fromDb) {
    if (fromDb == null) {
      return {};
    }
    return (json.decode(fromDb) as List<dynamic>)
        .map((e) => e as String)
        .toSet();
  }

  String mapToSql(Set<String>? value) {
    return json.encode(value?.toList() ?? []);
  }

  @override
  Set<String> fromSql(String fromDb) {
    throw UnimplementedError();
  }

  @override
  String toSql(Set<String> value) {
    throw UnimplementedError();
  }
}
