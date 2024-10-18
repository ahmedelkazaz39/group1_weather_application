
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';
import '../service/weather_service.dart';

class CitySearchController extends GetxController {
  String city;
  String lang;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  CitySearchController({ required this.city, required this.lang});

  void initState() {
  searchWeatherData(city);
  getFiveDaysDataSearch(city);
}

  void getTopFiveCities() {
    List<String> cities = [
      'Cairo',
      'Alexandria',
      'Giza',
      'Qalyubia',
      'Sharqia',
      'Dakahlia',
      'Beheira',
      'Kafr El Sheikh',
      'Gharbia',
      'Monufia',
      'Damietta',
      'Port Said',
      'Ismailia',
      'Suez',
      'North Sinai',
      'South Sinai',
      'Faiyum',
      'Beni Suef',
      'Minya',
      'Assiut',
      'Sohag',
      'Qena',
      'Luxor',
      'Aswan',
      'Red Sea',
      'Matrouh',
    ];
    cities.forEach((c) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      WeatherService(
          city: '${c}', lang: '${prefs.getString('_weather_lang') ?? lang}')
          .getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }


  void searchWeatherData(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeatherService(
        city: '${city}', lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getCurrentWeatherDataSearch(citySearch: city,
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) =>
        {
          print(error),
          update(),
        });
  }


  void getFiveDaysDataSearch(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeatherService(
        city: '${city}', lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }


}
