class CepModel {
  final String logradouro;
  final String bairro;
  final String cidade;
  final String uf;

  CepModel({
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.uf,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      cidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
    );
  }
}
