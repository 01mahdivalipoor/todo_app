import 'package:hive/hive.dart';

part 'done_model.g.dart';

@HiveType(typeId: 1)
class Done extends HiveObject {
  @HiveField(0)
  late String done;
}
