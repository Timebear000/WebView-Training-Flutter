import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: WebView2(),
    );
  }
}

// class WebView1 extends StatefulWidget {
//   WebView1({Key? key}) : super(key: key);

//   @override
//   State<WebView1> createState() => _WebView1State();
// }

// class _WebView1State extends State<WebView1> {
//   late WebViewController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WevView'),
//       ),
//       body: WebView(
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: 'https://m.facebook.com/login',
//         onWebViewCreated: (controller) {
//           this.controller = controller;
//         },
//         onPageStarted: (url) {
//           print('New Loadding : ${url}');
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           // Facebook Login
//           final email = 'johannes.facebook@gmail.com';
//           final password = 'asdw';
//           controller.runJavascriptReturningResult(
//               "document.getElementById('m_login_email').value='${email}'");
//           controller.runJavascriptReturningResult(
//               "document.getElementById('m_login_password').value='${password}'");
//           await Future.delayed(Duration(seconds: 1));
//           await controller.runJavascript("document.forms[0].submit()");
//           // controller.runJavascriptReturningResult(
//           //     "document.getElementsByTagName('header')[0].style.display='none'");

//           // this.controller.loadUrl("https://youtube.com");
//         },
//         child: const Icon(Icons.import_export, size: 32),
//       ),
//     );
//   }
// }

class WebView2 extends StatefulWidget {
  WebView2({Key? key}) : super(key: key);

  @override
  State<WebView2> createState() => _WebView2State();
}

class _WebView2State extends State<WebView2> {
  late WebViewPlusController controller;

//   String html = '''
//   <!DOCTYPE html>
//   <html>
//   <body>
//   <h1>This is heading 1</h1>
//   <h2>This is heading 2</h2>
//   <h3>This is heading 3</h3>
//   <h4>This is heading 4</h4>
//   <h5>This is heading 5</h5>
//   </body>
//   </html>

// ''';

  void loadLocalHtml() async {
    // String html = await rootBundle.loadString('assets/index.html');

    // final url = Uri.dataFromString(html,
    //         mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    //     .toString();
    // await controller.loadFlutterAsset('assets/index.html');
  }
  void call(path) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: '010-9926-7403'))) {
      print(true);
    } else {
      print(false);
    }
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: path,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WevView'),
      ),
      body: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'assets/index.html',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        javascriptChannels: {
          JavascriptChannel(
            name: "JavascriptChannel",
            onMessageReceived: (JavascriptMessage message) {
              print(message.message);
              call(message.message);
            },
          )
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.import_export, size: 32),
      ),
    );
  }
}
