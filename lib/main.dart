// Aluno: Leonardo Moya

import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pontos turísticos da Baixada Santista',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CatalogoPage(),
    );
  }
}

class PontoTuristico {
  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.imagemUrl,
    required this.descricao,
    this.favorito = false,
    this.visitado = false,
  });

  final String nome;
  final String cidade;
  final String imagemUrl;
  final String descricao;
  bool favorito;
  bool visitado;
}

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({super.key});

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  // Para trocar os pontos exibidos, basta editar esta lista.
  final List<PontoTuristico> _pontos = [
    PontoTuristico(
      nome: 'Orla da Praia do Gonzaga',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1565011523534-747a8601f10a'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Um dos cartões-postais de Santos, com jardins, ciclovia e uma '
          'vista agradável para o mar.',
    ),
    PontoTuristico(
      nome: 'Aquário Municipal de Santos',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Espaço tradicional da cidade que apresenta espécies marinhas e '
          'ações de educação ambiental.',
    ),
    PontoTuristico(
      nome: 'Praia da Enseada',
      cidade: 'Guarujá',
      imagemUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Praia extensa e bastante conhecida, ideal para caminhar, relaxar '
          'e apreciar o litoral do Guarujá.',
    ),
    PontoTuristico(
      nome: 'Morro do Voturuá',
      cidade: 'São Vicente',
      imagemUrl:
          'https://images.unsplash.com/photo-1469474968028-56623f02e42e'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Área elevada com paisagens da cidade e atividades de lazer ao ar '
          'livre, incluindo voo de paraglider.',
    ),
    PontoTuristico(
      nome: 'Fortaleza de Itaipu',
      cidade: 'Praia Grande',
      imagemUrl:
          'https://images.unsplash.com/photo-1524492412937-b28074a5d7da'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Construção histórica localizada no entorno do Parque Estadual '
          'Xixová-Japuí.',
    ),
    PontoTuristico(
      nome: 'Parque Estadual Restinga de Bertioga',
      cidade: 'Bertioga',
      imagemUrl:
          'https://images.unsplash.com/photo-1441974231531-c6227db76b6e'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Unidade de conservação com trilhas e rica biodiversidade de Mata '
          'Atlântica e restinga.',
    ),
    PontoTuristico(
      nome: 'Ruínas do Engenho São Jorge dos Erasmos',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1470770841072-f978cf4d019e'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Sítio arqueológico que preserva parte de um dos primeiros engenhos '
          'de açúcar do Brasil.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Baixada Santista'),
            Text('Leonardo Moya', style: TextStyle(fontSize: 12)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _pontos.length,
        itemBuilder: (context, index) {
          return _buildPontoCard(_pontos[index]);
        },
      ),
    );
  }

  Widget _buildPontoCard(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              ponto.imagemUrl,
              height: 190,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 190,
                  color: Colors.teal.shade50,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_not_supported, size: 48),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ponto.nome,
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 4),
                      Text(ponto.cidade),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ponto.descricao,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: const Text('Favorito'),
                      value: ponto.favorito,
                      onChanged: (value) {
                        setState(() {
                          ponto.favorito = value ?? false;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: const Text('Visitado'),
                      value: ponto.visitado,
                      onChanged: (value) {
                        setState(() {
                          ponto.visitado = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
