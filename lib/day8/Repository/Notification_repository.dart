import 'package:hive/hive.dart';
import '../Model/NotificationModel.dart';
class NotificationRepository {
  final String boxName = "notificationsBox";

  Future<void> addNotification(NotificationModel notification) async {
    final box = await Hive.openBox<NotificationModel>(boxName);
    
    int index = await box.add(notification);

    print("Notification saved at index: $index");
    print("Total notifications in Hive: ${box.length}");
    print("Saved Notification: ${box.get(index)}");
  }

  Future<List<NotificationModel>> getAllNotifications() async {
    final box = await Hive.openBox<NotificationModel>(boxName);
    return box.values.toList();
  }
}