class ListDto<T, U> {
  T key;
  U value;

  ListDto(this.key, this.value);

  factory ListDto.fromJSON(Map<String, dynamic> json) {
    return ListDto<T, U>(json['key'], json['value']);
  }
}