import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workshop/models/product_model.dart';
import 'package:workshop/services/api_services.dart';

enum FetchStatus { loading, success, error }

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  FetchStatus _status = FetchStatus.loading;
  List<ProductModel> _products = [];
  String _errorMessage = '';
  bool _isOffline = false;
  String _offlineMessage = '';

  FetchStatus get status => _status;
  List<ProductModel> get products => _products;
  String get errorMessage => _errorMessage;
  bool get isOffline => _isOffline;
  String get offlineMessage => _offlineMessage;

  Future<void> fetchProducts() async {
    _status = FetchStatus.loading;
    notifyListeners();

    try {
      _products = await _apiService.getProducts();
      _status = FetchStatus.success;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        _isOffline = true;
        _offlineMessage = e.type == DioExceptionType.connectionError
            ? 'Koneksi terputus. Memperlihatkan produk offline.'
            : 'Koneksi lambat. Waktu permintaan habis.';
      }

      if (_products.isNotEmpty) {
        _status = FetchStatus.success;
      } else {
        _status = FetchStatus.error;
        _errorMessage = 'Tidak ada koneksi internet untuk memuat produk.';
      }
    }

    notifyListeners();
  }
}
