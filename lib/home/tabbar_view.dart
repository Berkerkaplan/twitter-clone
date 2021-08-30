import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home/home_view.dart';
import 'package:twitter_clone/home/search_view.dart';

class TwitterTabBarView extends StatefulWidget {
  @override
  _TwitterTabBarViewState createState() => _TwitterTabBarViewState();
}

class _TwitterTabBarViewState extends State<TwitterTabBarView> {
  String _unSplashPhotoUrl =
      'https://s3.amazonaws.com/spectrumnews-web-assets/wp-content/uploads/2018/11/13154625/20181112-SHANK3monkey-844.jpg';
  bool isHeaderClose = false;
  double lastOffset = 0;
  ScrollController scrollController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }
      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  //Eğer app bar kapalı iken search e geçiş yaparsan kapalı geçiyor ama açık geçersen açık geçiyor

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButton: _fabButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: <Widget>[
            _containerAppBar,
            _tabBarView,
          ],
        ),
      ),
    );
  }

  Widget get _tabBarView {
    return Expanded(
      child: TabBarView(
        children: <Widget>[
          HomeView(scrollController),
          SearchView(scrollController),
          Text('berkerk'),
          Text('berkerk'),
        ],
      ),
    );
  }

  Widget get _bottomAppBar {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: _tabBarItems,
    );
  }

  Widget get _containerAppBar {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isHeaderClose ? 0 : MediaQuery.of(context).size.height * .12,
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
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(_unSplashPhotoUrl),
        ),
        _emptyWidth,
        Expanded(child: _centerAppBarWidget),
        _emptyWidth,
        Icon(
          Icons.alarm,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget get _emptyWidth {
    return SizedBox(
      width: 20.0,
    );
  }

  Widget get _centerAppBarWidget {
    return currentIndex == 1
        ? _searchTextField
        : Text(
            'Home',
            style: titleTextStyle,
          );
  }

  Widget get _searchTextField {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        hintText: 'Search Twitter',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        filled: true,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }

  OutlineInputBorder get outlineInputBorder {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  Widget get _fabButton {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {},
    );
  }

  Widget get _tabBarItems {
    return TabBar(
      isScrollable: false,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      tabs: <Widget>[
        Tab(icon: Icon(Icons.home)),
        Tab(icon: Icon(Icons.search)),
        Tab(icon: Icon(Icons.satellite)),
        Tab(icon: Icon(Icons.verified_user)),
      ],
    );
  }

  final titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: CupertinoColors.black,
  );
}

//This is a tabbar

// TabBar(
// tabs: <Widget>[
// Tab(
// icon: Icon(Icons.attach_money),
// ),
// Tab(
// icon: Icon(Icons.attach_money),
// ),
// Tab(
// icon: Icon(Icons.attach_money),
// ),
// Tab(
// icon: Icon(Icons.attach_money),
// ),
// ],
// ),
