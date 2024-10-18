import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/HomeController.dart';
import '../../controller/searchControlar.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
      Get.lazyPut(() => HomeController(
          lat: prefs.getDouble('_weather_lat') ?? 30.0444,
          lon: prefs.getDouble('_weather_lon') ?? 31.2357,
          lang: prefs.getString('_weather_lang') ?? 'en'));

    Get.lazyPut(() => CitySearchController(
        city: prefs.getString('_weather_city') ?? 'Cairo',
        lang: prefs.getString('_weather_lang') ?? 'en'));
  }
}
