import 'package:dio/dio.dart';
import 'package:recipeapp/Models/Rice%20Model/ricemodel.dart';

class RiceApiServices {
  Future<RiceModelClass> fetchRiceData() async {
    Dio dio = Dio();
    String apiUrl =
        "https://api.edamam.com/api/recipes/v2?type=public&q=rice&app_id=bfc78af6&app_key=%200e68ce13c869b02f21e7d0c7863f1cb3&imageSize=REGULAR&random=true&field=uri&field=label&field=image&field=images&field=dietLabels&field=healthLabels&field=ingredientLines&field=ingredients&field=cuisineType&field=mealType&field=dishType&from=1&to=20";

    String appId = 'bfc78af6';
    String appKey = '%200e68ce13c869b02f21e7d0c7863f1cb3';

    Map<String, String> headers = {
      'app_id': appId,
      'app_key': appKey,
    };
    var response = await dio.get(apiUrl,
        options: Options(method: 'GET', headers: headers));
    if (response.statusCode == 200) {
      print(response.data);
      return RiceModelClass.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
    throw Exception("Failed to load data");
  }
}
