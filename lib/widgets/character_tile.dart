import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars/models/character.dart';

class CharacterTile extends StatelessWidget {
  final CharacterModel character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');

    return Card(
      color: Colors.black,
      elevation: 0,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/default_char.png',
                ),
                backgroundColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Name : " + character.name.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "Gender : " + character.gender.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "Created at : " +
                          formatter.format(
                            DateTime.parse(
                              character.created.toString(),
                            ),
                          ),
                      style: Theme.of(context).textTheme.bodyText1,
                    )
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
