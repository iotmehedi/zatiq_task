import 'package:get/get.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/routes/router.dart';
import '../../../../../main.dart';
import '../../../core/app_component/app_component.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    checkApplicationInformation();
    super.onInit();
  }

void checkApplicationInformation()async{
  Future.delayed(const Duration(seconds: 3), () async {
      RouteGenerator.pushNamedAndRemoveAll(
          navigatorKey.currentContext!, Routes.productListScreen);
      box.erase();
  });
}
}