import 'package:discografia/bloc/music_bloc.dart';
import 'package:discografia/models/artista_model.dart';
import 'package:discografia/services/api_handler.dart';
import 'package:discografia/views/create_music_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistInfoWidget extends StatefulWidget {
  const ArtistInfoWidget({required this.artista, super.key});

  final ArtistaModel artista;

  @override
  State<ArtistInfoWidget> createState() => _ArtistInfoWidgetState();
}

class _ArtistInfoWidgetState extends State<ArtistInfoWidget> {
  final bloc = MusicBloc(ApiHandler());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchMusicFromArtist(id: widget.artista.artistaId!));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    widget.artista.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<MusicBloc, MusicState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is MusicLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is MusicSuccesFromId) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.artista.nome,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text("${state.list.length} músicas"),
                          ],
                        ),
                        SizedBox(height: 20),
                        state.list.isEmpty
                            ? Center(
                                child: Row(
                                  children: [
                                    Text("Nenhuma música adicionada"),
                                    SizedBox(width: 15),
                                    FilledButton(
                                      onPressed: () {},
                                      child: Text("Adicionar"),
                                    )
                                  ],
                                ),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final item = state.list[index];
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                            widget.artista.imgUrl,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            item.nome,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                  ),
                                                  child: Text(
                                                    item.duracao,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                  ),
                                                  child: Text(
                                                    item.genero,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemCount: state.list.length,
                              ),
                      ],
                    );
                  }

                  if (state is MusicError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  return const Text("Nada");
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return CreateMusicPage(
                  artista: widget.artista,
                );
              },
            ));
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
