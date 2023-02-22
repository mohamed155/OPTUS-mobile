import 'package:tech2/interfaces/has_map.dart';

class ListDto<T, U> implements Mappable {
  ListDto(this.key, this.value);

  factory ListDto.fromJSON(Map<String, dynamic> json) {
    return ListDto<T, U>(json['key'] as T, json['value'] as U);
  }

  T key;
  U value;

  @override
  Map<String, dynamic> toMap() {
    return {'key': key, 'value': value};
  }
}
