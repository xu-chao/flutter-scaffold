import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CounterStore _counter;

  @override
  void initState() {
    super.initState();
  }

  // 返回每个隐藏的菜单项
  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        leading: new Icon(Icons.home),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: '添加饮水提醒',
              onPressed: () {}),
          // 隐藏的菜单
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.selectView(Icons.code, '扫码', 'A'),
              this.selectView(Icons.phone, '测试', 'B'),
              this.selectView(Icons.view_list, '关于', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          ),
        ],
      ),
      body: contextWidget(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'homeBtn1',
        onPressed: () async {
          _counter.increment();
        },
        tooltip: '加加store值',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button(
                '测试页面',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/testDemo',
                    arguments: {'data': '别名路由传参666'},
                  );
                },
              ),
              Consumer<CounterStore>(
                builder: (_, counterStore, child) {
                  return Text('状态管理值：${counterStore.value}');
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _button(String text, {Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 22),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
