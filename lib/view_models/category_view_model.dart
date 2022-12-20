import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/repository/category_repository.dart';

import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel({required this.categoryRepository});

  List<CategoryModel>? categoryModel;

  CategoryRepository categoryRepository;

  fetchCategory() async {
    categoryModel = await categoryRepository.getAllCategories() as List<CategoryModel>;
    notifyListeners();
  }
}
