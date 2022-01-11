import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:random_anime_quotes/src/core/animations/animations.dart';
import 'package:random_anime_quotes/src/core/extensions/text_theme_styles_x.dart';
import 'package:random_anime_quotes/src/features/quotes/data/models/quote.dart';
import 'package:random_anime_quotes/src/features/quotes/logic/quote_provider.dart';

class LikedQuotesPage extends ConsumerWidget {
  const LikedQuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final likedQuotes = ref.watch(likedQuotesProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text('My Liked Quotes'),
            actions: [
              if (likedQuotes.isNotEmpty)
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const _InfoDialog(),
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              likedQuotes.isNotEmpty
                  ? likedQuotes.map((quote) => _QuoteItem(quote)).toList()
                  : [
                      const Center(
                        child: Text(
                          'Here you can see the phrases you liked,\nfor now it is still empty.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuoteItem extends ConsumerWidget {
  const _QuoteItem(
    this.quote, {
    Key? key,
  }) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        onLongPress: () {
          // todo: Find a better way QuoteState and LikedQuotes relations
          int? id = ref.read(quoteProvider).whenOrNull(data: (q) => q.id);
          if (id != null && id == quote.id) {
            ref.read(quoteProvider.notifier).like(quote);
          }
          ref.read(likedQuotesProvider.notifier).delete(quote.id);
        },
        onTap: () => ref.read(quoteProvider.notifier).copy(quote),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TranslateAnimation(
              x: -100,
              y: 0,
              child: Icon(
                Icons.format_quote_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text('${quote.said}\n', style: context.headline6),
          ],
        ),
        subtitle: Column(
          children: [
            Text(
              '${quote.quote}\n',
              style: context.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              quote.anime,
              style: context.subtitle1.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoDialog extends StatelessWidget {
  const _InfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'I-It\'s not that I want to help you or anything,'
            '\tI just had nothing else to do...',
            style: context.subtitle2
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            '\tOn Tap : Copy Quote',
            style: context.subtitle2,
          ),
          Text(
            '\tOn Long Press: Delete Quote',
            style: context.subtitle2,
          ),
          const SizedBox(height: 10),
          Text(
            'You had better be grateful!',
            style: context.subtitle2
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset('assets/images/tsundere.png'),
              const Text(
                'Press outside to dissmiss, b-baka!',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
