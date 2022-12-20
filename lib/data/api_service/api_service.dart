import 'package:dio/dio.dart';
import 'package:dio_example/data/api_service/api_client.dart';
import '../models/product_model.dart';
class ApiService extends ApiClient{

  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await dio
          .get(dio.options.baseUrl);
      if (response.statusCode == 200) {
        var jsonData = ProductModel.fromJson(response.data);
        List<ProductModel> products = (jsonData as List?)
                ?.map((item) => ProductModel.fromJson(item))
                .toList() ??
            [];
        return products;
      }throw Exception();
    } catch (error) {
      print(error.toString());
    }
    return [];
  }
}
