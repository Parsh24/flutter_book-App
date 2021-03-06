import 'package:flutter/material.dart';

import 'data.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = new AppBar(
      elevation: 4.0,
      leading: new IconButton(
        icon: new Icon(Icons.menu),
        onPressed: () {},
      ),
      title: new Center(child: new Text("Design Books")),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );

    createTile(Book book) => new Hero(
          tag: book.title,
          child: new Material(
            elevation: 15.0,
            shadowColor: Colors.yellow.shade900,
            // child: new Ink.image(
            //  image: new AssetImage(book.image),
            //  fit: BoxFit.cover,
            //  child: new InkWell(
            //    onTap: (){},
            //  )
            // ),
            child: new InkWell(
              onTap: () {
                Navigator.pushNamed(context ,'detail/${book.title}');
              },
              child: new Image(
                image: new AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    final grid = new CustomScrollView(
      primary: false,
      slivers: <Widget>[
        new SliverPadding(
          padding: new EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
    );
  }
}
