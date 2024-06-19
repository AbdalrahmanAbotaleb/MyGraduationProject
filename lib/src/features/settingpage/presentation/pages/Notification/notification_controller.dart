import 'package:get/get.dart';
import 'notification_services.dart';

class NotificationController extends GetxController {
  var isSwitched = false.obs;
  var notificationIconSelected = false.obs; // تتبع حالة الإيقونة المحددة

  final NotificationService notificationService = NotificationService();

  void toggleSwitch(bool value) {
    isSwitched.value = value;
    if (value) {
      notificationService.showNotification();
    } else {
      notificationService.cancelAllNotifications();
    }
  }

  void toggleNotificationIcon() {
    notificationIconSelected.value = !notificationIconSelected.value;
  }
}
