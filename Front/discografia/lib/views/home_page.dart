import 'package:discografia/bloc/artista_bloc.dart';
import 'package:discografia/bloc/artista_event.dart';
import 'package:discografia/bloc/artista_state.dart';
import 'package:discografia/views/create_artist_page.dart';
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
        title: Text('a'),
        actions: [
          IconButton(
              onPressed: () {
                widget.bloc.add(GetArtista());
              },
              icon: Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ArtistaBloc, ArtistaState>(
          bloc: widget.bloc,
          builder: (context, state) {
            if (state is ArtistaLoading) {
              print("entrou aqui loading");

              return CircularProgressIndicator();
            }

            if (state is ArtistaSuccess) {
              print("entrou aqui success");
              print(state.lista.length);
              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.lista.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  print("entrou aqui listview");

                  final item = state.lista[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(item.nome),
                      Text(item.qtdeMusica.toString())
                    ],
                  );
                },
              );
            }

            if (state is ArtistaErro) {
              print("entrou aqui erro");
              return Text(state.message);
            }
            print("entrou aqui container");

            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider.value(
                  value: BlocProvider.of<ArtistaBloc>(context),
                  child: CreateArtist(),
                );
              },
            ),
          ).then((_) {
            BlocProvider.of<ArtistaBloc>(context).add(GetArtista());
          });
        },
      ),
    );
  }
}
