import 'package:tech2/interfaces/has_map.dart';

class ListDto<T, U> implements HasMap {
  T key;
  U value;

  ListDto(this.key, this.value);

  factory ListDto.fromJSON(Map<String, dynamic> json) {
    return ListDto<T, U>(json['key'], json['value']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value
    };
  }
}