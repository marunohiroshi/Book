import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MaterialApp(home: ShrinkableFooterPage()));

class ShrinkableFooterPage extends StatefulWidget {
  @override
  _ShrinkablePageState createState() => new _ShrinkablePageState();
}

class _ShrinkablePageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController(); // スクロール中のコントローラーを設定
  bool isHiding = false; //フッターが隠れているかどうかのboolを設定

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                controller: _scrollController,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 50),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      color: Color(0xFFFEEAE6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 70),
                        Text(
                          'スクロールに応じて\nBottomNavigationBarが\n縮みます',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Color(0xFF442C2E),
                              height: 1.2),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  const SizedBox(height: 20),
                  Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  const SizedBox(height: 20),
                  Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  const SizedBox(height: 20),
                  Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  const SizedBox(height: 20),
                  Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  const SizedBox(height: 20),
                ],
              ),
              Positioned(
                child: _BottomNavigationBar(isHiding: isHiding),
                bottom: 0,
              )
            ],
          ),
        ));
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isHiding = true;
      } else {
        isHiding = false;
      }
      // setState(() {});
    });
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final bool isHiding;

  const _BottomNavigationBar({super.key, required this.isHiding});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height: isHiding ? 32 : 60,
      color: Color(0xFFFEEAE6),
      duration: Duration(microseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.home,
              title: 'Home',
              isHiding: isHiding,
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.star,
              title: 'Favorite',
              isHiding: isHiding,
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.favorite,
              title: 'Like',
              isHiding: isHiding,
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.settings,
              title: 'Menu',
              isHiding: isHiding,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  final double deviceWidth;
  final IconData icon;
  final String title;
  final bool isHiding;

  const _IconTextItem(
      {super.key,
      required this.deviceWidth,
      required this.icon,
      required this.title,
      required this.isHiding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              icon,
              color: Color(0xFF442C2E),
              size: 24,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: isHiding ? 0 : 1,
                duration: Duration(microseconds: 120),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
