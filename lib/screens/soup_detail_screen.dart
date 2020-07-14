import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/soups.dart';

class SoupDetailScreen extends StatelessWidget {
  static const routeName = '/soup-detail';
  @override
  Widget build(BuildContext context) {
    final soupId = ModalRoute.of(context).settings.arguments as String;
    final soupData = Provider.of<Soups>(context)
        .soupItems
        .firstWhere((soup) => soup.id == soupId);

    Widget buildContainerHeading(String title) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          soupData.title,
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Hero(
                      tag: soupData.imageUrl,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(soupData.imageUrl),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Chip(
                      label: Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text('${soupData.duration} mins'),
                        ],
                      ),
                    ),
                    Chip(
                      label: Text(soupData.origin),
                    ),
                  ],
                ),
                buildContainerHeading('Ingredients'),
                ...soupData.ingredients
                    .map(
                      (ingred) => Text(
                        '-$ingred',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    )
                    .toList(),
                buildContainerHeading('Stes Involved'),
                ...soupData.steps
                    .map(
                      (step) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: Icon(Icons.done_outline),
                          title: Text(
                            step,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
