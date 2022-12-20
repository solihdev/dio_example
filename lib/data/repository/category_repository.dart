import 'package:dio_example/data/api_service/api_service.dart';
import 'package:dio_example/data/models/category_model.dart';


class CategoryRepository{

  CategoryRepository({
    required this.apiService,
  });

  ApiService apiService;
  Future<List<CategoryModel?>?>getAllCategories()=> apiService.getAllCategories();


}