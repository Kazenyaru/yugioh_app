import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../../model/yugioh_card_info.dart';
import '../../tools/repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<Datum> _listDataYuGiOh = List<Datum>();
  int _numCount = 25;
  int _offsetCount = 0;
  int _totalCount = 0;
  ScrollController _scrollController = ScrollController();

  Future<void> _requestYuGiOhData({
    bool refresh = true,
  }) async {
    if (refresh) _offsetCount = 0;
    YuGiOhCardInfo _cardInfo = await Repository.fetchYuGiOhCard(
      numCount: _numCount,
      offsetCount: _offsetCount,
    );
    if (_cardInfo != null) {
      if (refresh) {
        await Repository.deleteYuGiOhCard();
        _listDataYuGiOh.clear();
      }
      await Repository.insertYuGiOhCard(_cardInfo);
    } else {
      _listDataYuGiOh.clear();
      _cardInfo = await Repository.readYuGiOhCard();
      _cardInfo.data.sort(
        (Datum datumA, Datum datumB) {
          String nameA = datumA.name.toLowerCase();
          String nameB = datumB.name.toLowerCase();
          return nameA.compareTo(nameB);
        },
      );
      _globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('cannot get new data'),
        ),
      );
    }
    _listDataYuGiOh.addAll(_cardInfo.data);
    _offsetCount = _cardInfo.meta.nextPageOffset;
    _totalCount = _cardInfo.meta.totalRows;
    setState(() {});
  }

  @override
  void initState() {
    _requestYuGiOhData();
    _scrollController.addListener(() {
      ScrollPosition position = _scrollController.position;
      if (position.pixels == position.maxScrollExtent) {
        _requestYuGiOhData(
          refresh: false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _itemCount = _listDataYuGiOh?.length ?? 0;
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(
          'Yu-Gi-Oh! Show $_offsetCount Of $_totalCount Cards',
        ),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          itemBuilder: _itemBuilder(
            itemCount: _itemCount,
          ),
          itemCount: _itemCount + 1,
        ),
        onRefresh: _requestYuGiOhData,
      ),
    );
  }

  IndexedWidgetBuilder _itemBuilder({int itemCount}) {
    return (BuildContext context, int index) {
      if (index == itemCount) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        );
      }
      return Card(
        child: ListTile(
          title: Text(_listDataYuGiOh[index]?.name ?? ''),
          onTap: () {
            Navigator.pushNamed(
              context,
              Constant.detailRouteName,
              arguments: _listDataYuGiOh[index] ?? '',
            );
          },
          onLongPress: () {
            _globalKey.currentState.showSnackBar(
              SnackBar(
                content: Text(_listDataYuGiOh[index]?.desc ?? ''),
              ),
            );
          },
        ),
      );
    };
  }
}
