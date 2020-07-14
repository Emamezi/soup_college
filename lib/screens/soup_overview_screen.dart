import 'package:flutter/material.dart';
import '../widgets/soup_grid.dart';

enum FilterOptions {
  ShowAll,
  OnlyFavourites,
}

class SoupOverviewScreen extends StatefulWidget {
  @override
  _SoupOverviewScreenState createState() => _SoupOverviewScreenState();
}

class _SoupOverviewScreenState extends State<SoupOverviewScreen> {
  var _showFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Soup College',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontFamily: Theme.of(context).textTheme.headline1.fontFamily,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selected) {
              setState(() {
                if (selected == FilterOptions.OnlyFavourites) {
                  _showFavourites = true;
                } else {
                  _showFavourites = false;
                }
              });
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Show Favourites'),
                value: FilterOptions.OnlyFavourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.ShowAll,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SoupGrid(_showFavourites),
    );
  }
}
