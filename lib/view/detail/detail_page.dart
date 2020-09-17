import 'package:flutter/material.dart';

import '../../model/yugioh_card_info.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Datum _yuGiOhCard;

  @override
  Widget build(BuildContext context) {
    _yuGiOhCard = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_yuGiOhCard?.name ?? ''),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        children: _children(),
      ),
    );
  }

  List<Widget> _children() {
    int _length = _yuGiOhCard?.cardSets?.length ?? 0;
    return List<Widget>.generate(
      _length + (_length == 0 ? 1 : 2),
      (int index) {
        if (index == 0) {
          return Image.network(
            _yuGiOhCard?.cardImages[0]?.imageUrl ?? '',
            errorBuilder: (
              BuildContext context,
              Object object,
              StackTrace stackTrace,
            ) {
              return ListTile(
                title: Text(
                  'failed to load image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        } else if (index == 1) {
          return ListTile(
            title: Text(
              'Card Sets',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          CardSet _cardSet = _yuGiOhCard?.cardSets[index - 2];
          return Card(
            child: ListTile(
              title: Text(_cardSet?.setName ?? ''),
            ),
          );
        }
      },
    );
  }
}
