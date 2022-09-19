import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: SliverAppBarPage()));

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => new _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1.0;
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: _textScale,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('記事カテゴリー'),
                  background: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.network(
                          'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter, //グラデーション開始位置
                              end: FractionalOffset.bottomCenter, //グラデーション終了位置
                              stops: [
                                0.5,
                                1
                              ], //開始位置を０、終了位置を１として指定。今回は下半分
                              colors: [
                                Colors.grey.withOpacity(0),
                                Colors.black38,
                              ]),
                        ),
                      )
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('文字を大きく'),
                            Switch(
                                value: _isLarge, onChanged: _toggleLargeFont),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Text('Sept. 29 2020')),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Text('記事タイトル'),
                        Divider(
                          height: 30,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://hearthadve.gamewiki.jp/wp-content/uploads/バーテンダー・ボブ-scaled.jpg',
                              ),
                              radius: 26,
                              backgroundColor: Colors.grey[200],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text('ボブ'), Text('バーテンダー')],
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('350'),
                            SizedBox(
                              width: 16.0,
                            ),
                            Icon(Icons.comment, color: Colors.blueAccent),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('25'),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            'jfdksafdjkalfjdalfjdklafjdlafkjdafdjfadjfdksaljfdalkf'),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void _toggleLargeFont(bool isLarge) {
    isLarge ? _textScale = 1.2 : _textScale = 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }
}
