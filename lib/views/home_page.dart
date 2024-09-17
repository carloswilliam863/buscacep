import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscacep/controllers/cep_controller.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _cepController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cepController = Provider.of<CepController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CEP ViaCep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cepController,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final cep = _cepController.text;
                if (cep.isNotEmpty) {
                  cepController.fetchCep(cep);
                }
              },
              child: const Text('Consultar CEP'),
            ),
            const SizedBox(height: 16.0),
            if (cepController.isLoading)
              const CircularProgressIndicator()
            else if (cepController.cepModel != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Logradouro: ${cepController.cepModel!.logradouro}'),
                  Text('Bairro: ${cepController.cepModel!.bairro}'),
                  Text('Cidade: ${cepController.cepModel!.cidade}'),
                  Text('UF: ${cepController.cepModel!.uf}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
