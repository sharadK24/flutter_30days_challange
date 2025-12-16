import 'package:hive/hive.dart';
part 'NotificationModel.g.dart';

@HiveType(typeId: 8)
class NotificationModel {

  @HiveField(0)
  String notificationId;

  @HiveField(1)
  String userId;

  @HiveField(2)
  String title;

  @HiveField(3)
  String message;

  @HiveField(4)
  String type;

  @HiveField(5)
  String createdAt;

  @HiveField(6)
  bool isRead;


  NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    required this.isRead,
  });
}


