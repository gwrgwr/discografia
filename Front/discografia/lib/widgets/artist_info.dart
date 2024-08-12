import 'package:discografia/models/artista_model.dart';
import 'package:flutter/material.dart';

class ArtistInfoWidget extends StatelessWidget {
  const ArtistInfoWidget({required this.item, super.key});

  final ArtistaModel item;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.nome),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ),
    );
  }
}
