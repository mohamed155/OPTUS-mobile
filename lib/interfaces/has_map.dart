abstract class Mappable {
  Map<String, dynamic> toMap();
}

class MappableList extends Mappable {
  MappableList(this.list);

  final List<Mappable> list;

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': list.map((item) => item.toMap()).toList(),
    };
  }

  List<Map<String, dynamic>> toMapList() {
    return list.map((item) => item.toMap()).toList();
  }
}
