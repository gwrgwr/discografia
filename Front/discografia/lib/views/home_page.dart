import 'package:discografia/bloc/artista_bloc.dart';
import 'package:discografia/bloc/artista_event.dart';
import 'package:discografia/bloc/artista_state.dart';
import 'package:discografia/views/create_artist_page.dart';
import 'package:discografia/widgets/artist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.bloc, super.key});

  final ArtistaBloc bloc;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetArtista());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discografia'),
        actions: [
          IconButton(
            onPressed: () {
              widget.bloc.add(GetArtista());
            },
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // TODO fetch from db local items to list, to make blocbuilder easier to rebuild after post;
          BlocBuilder<ArtistaBloc, ArtistaState>(
            bloc: widget.bloc,
            builder: (context, state) {
              if (state is ArtistaLoading) {
                return const CircularProgressIndicator();
              }

              if (state is ArtistaSuccess) {
                // return ListView.separated(
                //   shrinkWrap: true,
                //   itemCount: state.lista.length,
                //   separatorBuilder: (context, index) => SizedBox(height: 10),
                //   itemBuilder: (context, index) {
                //     final item = state.lista[index];
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [Text(item.nome), Text(item.qtdeMusica.toString())],
                //     );
                //   },
                // );

                if (state.lista.isEmpty) {
                  return const Center(
                    child: Text("Lista de artistas vazia"),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 150,
                    ),
                    itemCount: state.lista.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = state.lista[index];
                      return ArtistCard(item: item);
                    },
                  ),
                );
              }

              if (state is ArtistaErro) {
                return Text(state.message);
              }

              return Container();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider.value(
                  value: widget.bloc,
                  child: CreateArtist(
                    bloc: widget.bloc,
                  ),
                );
              },
            ),
          ).then((_) {
            widget.bloc.add(GetArtista());
          });
        },
      ),
    );
  }
}
