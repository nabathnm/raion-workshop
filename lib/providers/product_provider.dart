import 'package:flutter/material.dart';
import 'package:level_1/models/product_model.dart';
import 'package:level_1/services/api_services.dart';

enum FetchStatus { loading, success, error }

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  FetchStatus _status = FetchStatus.loading;
  List<ProductModel> _products = [];
  String _errorMessage = '';

  FetchStatus get status => _status;
  List<ProductModel> get products => _products;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _status = FetchStatus.loading;

    notifyListeners();

    try {
      _products = await _apiService.getProducts();

      _status = FetchStatus.success;
    } catch (e) {
      _status = FetchStatus.error;

      _errorMessage = 'Gagal mengambil data';
    }

    notifyListeners();
  }
}
