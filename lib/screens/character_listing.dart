import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/bloc/character_listing_bloc.dart';
import 'package:starwars/models/character.dart';
import 'package:starwars/repository/repository.dart';
import 'package:starwars/screens/character_details.dart';
import 'package:starwars/widgets/character_tile.dart';

class CharacterListing extends StatefulWidget {
  const CharacterListing({Key? key}) : super(key: key);

  @override
  State<CharacterListing> createState() => _CharacterListingState();
}

class _CharacterListingState extends State<CharacterListing> {
  final ScrollController _scrollController = ScrollController();
  int? total = 0;
  int offset = 10;
  List<CharacterModel>? characters = [];
  late CharacterListingBloc charBloc;

  @override
  void initState() {
    charBloc = CharacterListingBloc(RepositoryProvider.of<Repository>(context));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
    super.initState();
  }

  void _loadMore() {
    if (characters!.length < total!.toInt()) {
      double page = characters!.length / offset + 1;
      charBloc.add(LoadMoreCharacterListingEvent(page.toInt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => charBloc..add(const LoadCharacterListingEvent(1)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Image.asset(
              'assets/starwarslogo.png',
              height: 120,
              width: 120,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: BlocBuilder<CharacterListingBloc, CharacterListingState>(
            builder: (context, state) {
              // loading state
              if (state is CharacterListingLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // loaded state
              if (state is CharacterListingLoadedState) {
                total = state.responseModel.count;
                characters =
                    [...characters!] + [...?state.responseModel.results];
                return ListView.builder(
                  controller: _scrollController,
                  addAutomaticKeepAlives: false,
                  itemCount: total == characters!.length
                      ? characters!.length
                      : characters!.length + 1,
                  itemBuilder: (_, index) {
                    if (characters!.length == index) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                    return GestureDetector(
                      child: CharacterTile(character: characters![index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetails(
                              character: characters![index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              // error state
              if (state is CharacterListingErrorState) {
                return Center(
                  child: Text(
                    'Whoops! Something went wrong.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
