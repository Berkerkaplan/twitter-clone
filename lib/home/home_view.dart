import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView(this.scrollController);

  final ScrollController scrollController;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _unSplashPhotoUrl = 'https://unsplash.com/photos/x9cXI2eQLBw';
  String _randomImage =
      'https://s3.amazonaws.com/spectrumnews-web-assets/wp-content/uploads/2018/11/13154625/20181112-SHANK3monkey-844.jpg'; //https://picsum.photos/200/300
  String _dummyTweet =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s';
  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: _fabButton, //Burada floating action button i kullanabilirsin ama iki buton varmış gibi oluyor
      //birinden birini kaldır ben bunu yorum satırına aldım.
      body: _listView,
    );
  }

  Widget get _fabButton {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget get _containerAppBar {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isHeaderClose ? 0 : 50.0,
      child: _appBar,
    );
  }

  Widget get _appBar {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      title: _appBarItems,
    );
  }

  Widget get _appBarItems {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.0,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(_unSplashPhotoUrl),
        ),
        Text(
          'Home',
          style: titleTextStyle,
        ),
      ],
    );
  }

  Widget get _tabBarItems {
    return TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.dashboard)),
        Tab(icon: Icon(Icons.dashboard)),
        Tab(icon: Icon(Icons.dashboard)),
        Tab(icon: Icon(Icons.dashboard)),
      ],
    );
  }

  Widget get _expandedListView {
    return Expanded(
      child: _listView,
    );
  }

  Widget get _listView {
    return ListView.builder(
      itemCount: 10,
      controller: widget.scrollController,
      itemBuilder: (context, index) {
        return _listViewCard;
      },
    );
  }

  Widget get _listViewCard {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_randomImage),
        ),
        title: Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          children: <Widget>[
            _listCardTitle('Hello'),
            Text(_dummyTweet),
            _placeHolderField,
            _footerButtonRow,
          ],
        ),
      ),
    );
  }

  Widget _listCardTitle(String text) {
    return Text(text, style: titleTextStyle);
  }

  Widget get _placeHolderField {
    return Container(
      height: 100.0,
      child: Placeholder(),
    );
  }

  Widget get _footerButtonRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
      ],
    );
  }

  Widget _iconLabel(String text) {
    return Wrap(
      spacing: 5.0,
      children: <Widget>[
        Icon(
          Icons.comment,
          color: CupertinoColors.inactiveGray,
        ),
        Text(text),
      ],
    );
  }

  Widget get _iconLabelButton {
    return InkWell(
      child: _iconLabel('1'),
      onTap: () {},
    );
  }

  final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: CupertinoColors.black,
  );
}

//SafeArea nın yapısı

// SafeArea(
// child: DefaultTabController(
// length: 4,
// child: Column(
// children: <Widget>[
// _containerAppBar,
// _tabBarItems,
// _expandedListView,
// ],
// ),
// ),
// )
