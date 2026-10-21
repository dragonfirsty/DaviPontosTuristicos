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
        scaffoldBackgroundColor: const Color(0xFFF4F8F7),
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
    PontoTuristico(
      nome: 'Jardim Botânico Chico Mendes',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1497250681960-ef046c08a56e'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Área verde com árvores, jardins e espaços para caminhadas, '
          'lazer e contato com a natureza.',
    ),
    PontoTuristico(
      nome: 'Museu do Café',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1445116572660-236099ec97a0'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Museu instalado no centro histórico de Santos, que conta a '
          'importância do café para a história do Brasil.',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'São Vicente',
      imagemUrl:
          'https://images.unsplash.com/photo-1500534623283-312aade485b7'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Ponto tradicional com vista panorâmica para o litoral e para as '
          'praias de São Vicente.',
    ),
    PontoTuristico(
      nome: 'Orquidário Municipal de Santos',
      cidade: 'Santos',
      imagemUrl:
          'https://images.unsplash.com/photo-1455587734955-081b22074882'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Parque zoobotânico com orquídeas, árvores, animais e espaços para '
          'passeios tranquilos em meio à natureza.',
    ),
    PontoTuristico(
      nome: 'Parque Municipal Cotia-Pará',
      cidade: 'Cubatão',
      imagemUrl:
          'https://images.unsplash.com/photo-1501854140801-50d01698950b'
          '?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Área de lazer e educação ambiental com trilhas, espaços verdes e '
          'vista para a paisagem natural de Cubatão.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Baixada Santista'),
            Text('Leonardo Moya', style: TextStyle(fontSize: 12)),
          ],
        ),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double cardWidth = constraints.maxWidth >= 820
              ? (constraints.maxWidth - 52) / 2
              : constraints.maxWidth;

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1120),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore a Baixada Santista',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: const Color(0xFF123A35),
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Descubra lugares especiais, salve seus favoritos '
                        'e acompanhe suas visitas.',
                        style: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(color: Colors.blueGrey.shade700),
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 20,
                        runSpacing: 18,
                        children: [
                          for (final ponto in _pontos)
                            SizedBox(
                              width: cardWidth,
                              child: _buildPontoCard(ponto),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPontoCard(PontoTuristico ponto) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        shadowColor: Colors.teal.withValues(alpha: 0.18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.teal.shade50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              ponto.imagemUrl,
              height: 205,
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
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ponto.nome,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF123A35),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.teal.shade700,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ponto.cidade,
                        style: TextStyle(
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    ponto.descricao,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: ponto.favorito
                          ? Colors.amber.shade50
                          : Colors.grey.shade50,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      activeColor: Colors.amber.shade700,
                      secondary: Icon(
                        ponto.favorito
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: Colors.amber.shade700,
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: ponto.visitado
                          ? Colors.teal.shade50
                          : Colors.grey.shade50,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      activeColor: Colors.teal.shade700,
                      secondary: Icon(
                        ponto.visitado
                            ? Icons.check_circle_rounded
                            : Icons.check_circle_outline_rounded,
                        color: Colors.teal.shade700,
                      ),
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
