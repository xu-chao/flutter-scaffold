import '../../../utils/util.dart';
import 'package:flutter/material.dart';

class Hot extends StatefulWidget {
  Hot({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('统计'),
        leading: new Icon(Icons.poll),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '统计',
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
