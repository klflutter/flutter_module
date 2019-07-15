import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class FirstRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open second route'),
          onPressed: () {

            FlutterBoost.singleton.openPage("router://flutter/secondpage", {}, animated: true, resultHandler:(String key , Map<dynamic,dynamic> result){
              print("did recieve second route result $key $result");
            });

          },
        ),
      ),
    );
  }
}

class SecondRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            
            BoostContainerSettings settings = BoostContainer.of(context).settings;
            if(settings.params.containsKey("result_id")){
              String rid = settings.params["result_id"];
              FlutterBoost.singleton.onPageResult(rid, {"data":"works"},{});
            }

            FlutterBoost.singleton.closePageForContext(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class TabRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.openPage("router://flutter/secondpage", {}, animated: true);
              },
              child: Text('Open second route'),
            ),
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.openPage("router://native/loginpage", {
                                "query": {"description": "hello"}
                              });
              },
              child: Text('跳转到原生界面'),
            ),
          ],
        )
      ),
    );
  }
}

