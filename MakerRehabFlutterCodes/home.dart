import 'package:flutter/material.dart';

import 'main.dart';

class Page {
  Page(String route) {
    final endPoint = route.split('/').last;
    name = endPoint;
    this.endPoint = endPoint;
  }

  late String name;
  late String endPoint;
}

class PageCard extends StatelessWidget {
  const PageCard({
    required Key key,
    required this.package,
    required this.onPressed,
  }) : super(key: key);

  final Page package;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline6!;
    final TextStyle descriptionStyle = theme.textTheme.bodyText2!;

    return Container(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            onPressed(package.endPoint);
          },
          child: Card(
              child: DefaultTextStyle(
            maxLines: 3,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      package.name,
                      style: TextStyle(fontFamily: 'Fancy', fontSize: 40),
                      // style: titleStyle,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}

const white = Color.fromARGB(255, 255, 255, 255);
const black = Color.fromARGB(255, 0, 0, 0);
const grey = Color.fromARGB(239, 183, 218, 255);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: grey,
          title: const Text('Welcome',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 55)),
        ),
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Image.asset(
                            'assets/images/LPI-large-no-tagline-removebg-preview.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 115,
                          child: Image.asset(
                            'assets/images/UniversiteParis_monogramme_couleur_CMJN-removebg-preview.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ])),
              Container(
                width: 500,
                child: Image.asset(
                  'assets/images/APP_LOGO_Final.png',
                  // fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: const Text('A Faller Identifier',
                      style: TextStyle(fontFamily: 'Fancy', fontSize: 55))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(36),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuRoute()),
                  );
                },
              )
            ])))));
  }
}

class MenuRoute extends StatelessWidget {
  const MenuRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = routes.keys.toList().sublist(1).map((route) => Page(route));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: grey,
          automaticallyImplyLeading: false, //remove back button
          title: const Text('Home',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        body: ListView(
            children: pages
                .map((package) => (PageCard(
                      key: Key(package.name),
                      package: package,
                      onPressed: (String endPoint) {
                        Navigator.pushNamed(context, '/examples/$endPoint');
                      },
                    )))
                .toList()));
  }
}
