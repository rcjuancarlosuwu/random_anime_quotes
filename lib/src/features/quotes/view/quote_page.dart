import 'package:flutter/material.dart';

import 'package:random_anime_quotes/src/core/constants/constants.dart';

import 'widgets/widgets.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppName),
        actions: const [SettingsButton()],
      ),
      body: Column(
        children: const [
          Expanded(
            flex: 2,
            child: QuoteCard(),
          ),
          Expanded(
            flex: 1,
            child: QuoteOptions(),
          )
        ],
      ),
    );
  }
}

/*
Text('Hi there, Senpai!', style: context.headline4),
const SizedBox(height: 5),
Text(
  'Would you like to have dinner?',
  textAlign: TextAlign.start,
  style: context.subtitle2,
),
ListTile(
  title: const Text('See Saved Quotes'),
  trailing: const Icon(CupertinoIcons.heart),
  onTap: () {},
),
Text(
  'Would you like a bath?',
  textAlign: TextAlign.start,
  style: context.subtitle2,
),
SwitchListTile(
  value: true,
  onChanged: (v) {},
  title: const Text('Receive Daily Notifications'),
),
Text(
  'Or, perhaps... would... you... like... to give a start to this repo?',
  textAlign: TextAlign.start,
  style: context.subtitle2,
),
*/
