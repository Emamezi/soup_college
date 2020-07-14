import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/soup.dart';
import '../screens/soup_detail_screen.dart';

class SoupItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final soup = Provider.of<Soup>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SoupDetailScreen.routeName,
                      arguments: soup.id);
                },
                child: Hero(
                  tag: soup.imageUrl,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(soup.imageUrl),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    soup.title,
                    style: TextStyle(fontSize: 18),
                  ),
                  // SizedBox(width: 10),
                  Consumer<Soup>(
                    builder: (ctx, soups, ch) => IconButton(
                      color: Theme.of(context).errorColor,
                      icon: Icon(soups.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        soups.toggleFavouriteStatus();
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('${soup.title} Added Successfully'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                soups.toggleFavouriteStatus();
                              }),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
