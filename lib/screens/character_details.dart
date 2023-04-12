import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars/models/character.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.yellow,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Text(
              character.name.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      'assets/default_char.png',
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Height : " + character.height.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mass : " + character.mass.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hair Color : " + character.hairColor.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Eye Color : " + character.eyeColor.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Gender : " + character.gender.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Birth year : " + character.birthYear.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "List of vehicles : n/a",
                  // + character.vehicles.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Created at : " +
                      formatter.format(
                        DateTime.parse(
                          character.created.toString(),
                        ),
                      ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
