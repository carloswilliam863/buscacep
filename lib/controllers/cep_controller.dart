import 'dart:convert';
import 'package:buscacep/models/cep_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CepController with ChangeNotifier {
  CepModel? cepModel;
  bool isLoading = false;

  Future<void> fetchCep(String cep) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      cepModel = CepModel.fromJson(json.decode(response.body));
    }

    isLoading = false;
    notifyListeners();
  }
}
