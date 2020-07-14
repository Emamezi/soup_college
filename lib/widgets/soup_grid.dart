import 'package:flutter/material.dart';
import '../widgets/soup_item.dart';
import 'package:provider/provider.dart';
import '../provider/soups.dart';

class SoupGrid extends StatelessWidget {
  final bool isFavs;
  SoupGrid(this.isFavs);

  @override
  Widget build(BuildContext context) {
    final soup = Provider.of<Soups>(context);
    final soupData = isFavs ? soup.showFavourites : soup.soupItems;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // childAspectRatio: 3/2
      ),
      itemCount: soupData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: soupData[i],
        child: SoupItem(),
      ),
    );
  }
}
