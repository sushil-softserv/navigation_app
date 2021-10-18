import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  const ArtRoute({required this.art});
  static int _currentIndex = 0;
  //const ArtRoute({ required this.art});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
                child: Text('Choose your art', style: TextStyle(fontSize: 24, color: Colors.white),),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                image: DecorationImage(image: NetworkImage('http://bit.ly/fl_sky'),
                fit: BoxFit.fill
                )
              ),

            ),
            ListTile(
              title: const Text(ArtUtil.CARAVAGGIO),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
            ),
            ListTile(
              title: const Text(ArtUtil.MONET),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.MONET),
            ),
            ListTile(
              title: const Text(ArtUtil.VANGOGH),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Navigating art'),
        actions: <Widget>[
          PopupMenuButton(
            //icon: const Icon(Icons.image),
            //child: const Text('Change Route'),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  child: Text(item),
                  value: item,
                );
              }).toList();
            },
            onSelected: (String value) => changeRoute(context, value),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(art), fit: BoxFit.cover)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: ArtUtil.CARAVAGGIO,
            icon: Icon(Icons.art_track),),
          BottomNavigationBarItem(
            label: ArtUtil.MONET,
            icon: Icon(Icons.art_track),),
          BottomNavigationBarItem(
            label: ArtUtil.VANGOGH,
            icon: Icon(Icons.art_track),),
        ],
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, _artist);
        },
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = '';
    switch(menuItem) {
      case ArtUtil.CARAVAGGIO:{
        image = ArtUtil.IMG_CARAVAGGIO;
        break;
      }
      case ArtUtil.MONET:{
        image = ArtUtil.IMG_MONET;
        break;
      }
      case ArtUtil.VANGOGH:{
        image = ArtUtil.IMG_VANGOGH;
        break;
      }
    }

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ArtRoute(art: image,)
    ));
  }
}
