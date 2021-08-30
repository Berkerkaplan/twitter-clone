import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/custom/refresh2.dart';
import 'package:twitter_clone/model/trend_topic.dart';

class SearchView extends StatefulWidget {
  SearchView(this.scrollController);
  final ScrollController scrollController;
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TrendTopic _topic;
  double _padding = 20.0;
  bool isRefresh = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topic = TrendTopic(
        hashtag: '#Champions Leage',
        location: 'Trending in Turkey',
        tweets: '16.8K Tweets');
  }

  Future tempFuture() async {
    setState(() {
      isRefresh = !isRefresh;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      isRefresh = !isRefresh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator2(
        onRefresh: tempFuture,
        child: ListView(
          children: <Widget>[
            _downIconWidget,
            _emptySpace,
            _trendTitleWidget,
            _listHashView,
          ],
        ),
      ),
    );
  }

  Widget get _emptySpace {
    return SizedBox(
      height: 10,
    );
  }

  Widget get _downIconWidget {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isRefresh ? 60.0 : 30.0,
      child: isRefresh
          ? Center(child: CircularProgressIndicator())
          : Icon(Icons.arrow_downward),
    );
  }

  Widget get _trendTitleWidget {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.all(0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        height: 50.0,
        alignment: Alignment.centerLeft,
        child: Text('Trends for you',
            style: Theme.of(context).textTheme.headline1),
      ),
    );
  }

  Widget get _divider {
    return Divider(
      height: 0.0,
      color: Colors.grey,
    );
  }

  Widget get _listHashView {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return _divider;
      },
      itemBuilder: (context, index) {
        return cardListMethod(context);
      },
    );
  }

  Card cardListMethod(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.0),
      shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.none, color: Colors.transparent)),
      child: listPadding(context),
    );
  }

  Padding listPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 5.0),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            spacing: 5.0,
            children: <Widget>[
              Text(
                _topic.location,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                _topic.hashtag,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 15.0),
              ),
              Text(
                _topic.tweets,
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
