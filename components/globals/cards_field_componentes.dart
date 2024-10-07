// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:frontfaxina/app/components/globals/texto_components.dart';

class CardsFieldComponentes extends StatefulWidget {
  final int id;
  final String name;
  final double precoMedio;
  final String categoria;
  final int avaliacao;
  final String distanciaKm;
  final bool isFavorite;
  final VoidCallback onLiked;

  const CardsFieldComponentes({
    super.key,
    required this.id,
    required this.name,
    required this.precoMedio,
    required this.categoria,
    required this.avaliacao,
    required this.distanciaKm,
    required this.isFavorite,
    required this.onLiked,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CardsFieldComponentesState createState() => _CardsFieldComponentesState();
}

class _CardsFieldComponentesState extends State<CardsFieldComponentes> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: const Color(0xFF00AC47).withAlpha(30),
        onTap: () {},
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomText(
                    widget.name,
                    fontSize: 20,
                  ),
                  GestureDetector(
                    onTap: widget.onLiked,
                    child: widget.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
              Text(
                'Preço médio: ${widget.precoMedio}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Categoria: ${widget.categoria}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Avaliação: ${widget.avaliacao}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                child: Row(
                  children: [
                    const Icon(Icons.map),
                    Text('${widget.distanciaKm} km'),
                    TextButton(
                      onPressed: () {},
                      child: MyCustomText(
                        'Verificar agenda',
                        fontSize: 12,
                        color: const Color(0xFF912DB5),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
