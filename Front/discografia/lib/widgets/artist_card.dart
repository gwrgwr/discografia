import 'package:discografia/models/artista_model.dart';
import 'package:discografia/widgets/artist_info.dart';
import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({required this.item, super.key});

  final ArtistaModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            item.imgUrl,
            scale: 0.8,
          ),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Center(
            child: Text(
              item.nome,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ArtistInfoWidget(artista: item),
              );
            },
          ),
        ],
      ),
    );
  }
}
