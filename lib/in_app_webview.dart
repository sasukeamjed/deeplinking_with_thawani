// // import 'package:deeplinking_with_thawani/router.dart';
// // import 'package:deeplinking_with_thawani/thawani/thawani_cart_item.dart';
// // import 'package:deeplinking_with_thawani/thawani/thawani_payment_api.dart';
// // import 'package:deeplinking_with_thawani/thawani/thawani_payment_session.dart';
// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// //
// // void main() => runApp(const MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   //
// //   // @override
// //   // Widget build(BuildContext context) {
// //   //   return MaterialApp.router(
// //   //     title: 'Deep Linking Example',
// //   //     routerConfig: router,
// //   //   );
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Deep Linking Example',
// //       home: HomePage(),
// //       // onGenerateRoute: (settings){
// //       //   if(settings.name == '/details'){
// //       //     return MaterialPageRoute(builder: (context)=> DetailsPage());
// //       //   }
// //       //
// //       //   return MaterialPageRoute(builder: (context)=>HomePage());
// //       // },
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home Page'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             _launchURL(context, '/details');
// //           },
// //           child: const Text('Open Details Page'),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class DetailsPage extends StatelessWidget {
// //   const DetailsPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Details Page'),
// //       ),
// //       body: const Center(
// //         child: Text('This is the thawani page.'),
// //       ),
// //     );
// //   }
// // }
// //
// // Future<void> _launchURL(BuildContext context, String routeName) async {
// //   // final url = Uri.parse('myghzlahapp:$routeName'); // Use your app's custom URL scheme
// //
// //   final url = Uri.parse('https://ghazlah$routeName'); // Use your app's custom URL scheme
// //
// //   // final url = Uri.parse('https://myghzlahapp.com$routeName');
// //
// //   //Costum scheme app link
// //   // final url = Uri.parse('http://ghazlah.com$routeName');
// //
// //   // final paymentSession = ThawaniPaymentSession(<ThawaniCartItem>[], "123", "First Name");
// //   //
// //   // final theGeneratedSession = paymentSession.generateSessionData();
// //   //
// //   // PaymentsAPI api = PaymentsAPI();
// //   //
// //   // try{
// //   //   Map sessionData = await api.generateSessionRequest(theGeneratedSession);
// //   //   if(sessionData["success"]){
// //   //     print('generating session was success');
// //   //     // String thawaniPublishableKey = "jXejEJYYbW6mw1YOl6BDLzgQiVqPjz";
// //   //     String thawaniPublishableKey = "HGvTMLDssJghr9tlN9gr4DVYt0qyBy";
// //   //     String session_id = sessionData["data"]["session_id"];
// //   //
// //   //     final Uri uri = Uri(scheme: 'https', host: 'uatcheckout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
// //   //     // final Uri uri = Uri(scheme: 'https', host: 'checkout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
// //   //
// //   //     print("structured url => $uri");
// //   //     var response = await launchUrl(uri, mode: LaunchMode.externalApplication);
// //   //     print("This is response from launch url => $response");
// //   //     // if(await canLaunchUrl(uri)){
// //   //     //   print("url was launched with condition");
// //   //     //   await launchUrl(uri);
// //   //     // }
// //   //   }
// //   // }catch(e){
// //   //   print("Erorr payment");
// //   // }
// //
// //   print("this is route name => $routeName");
// //   if (await canLaunch(url.toString())) {
// //     await launch("https://ghazlah.com");
// //   } else {
// //     throw 'Could not launch $url';
// //   }
// // }
// //
// //
//
import 'dart:async';
import 'dart:io';

import 'package:deeplinking_with_thawani/thawani/thawani_cart_item.dart';
import 'package:deeplinking_with_thawani/thawani/thawani_payment_api.dart';
import 'package:deeplinking_with_thawani/thawani/thawani_payment_session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:deeplinking_with_thawani/in_app_webview.dart';



void main() => runApp(const MaterialApp(home: HomePage(),));


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> WebView()));
            // _launchURL(context, '/details');
          },
          child: const Text('Open Details Page'),
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {


  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  double _progress = 0;

  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.ghazlah.com/"),
            ),
            onWebViewCreated: (InAppWebViewController controller){
              inAppWebViewController = controller;
            },
            onProgressChanged: (InAppWebViewController controller, int progress){
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DetailsPage2 extends StatelessWidget {


  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: const Center(
        child: Text('This is the thawani page.'),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String routeName) async {
  // final url = Uri.parse('myghzlahapp://$routeName'); // Use your app's custom URL scheme
  final url = Uri.parse('https://myghzlahapp.com$routeName');

  final paymentSession = ThawaniPaymentSession(<ThawaniCartItem>[], "123", "First Name");

  final theGeneratedSession = paymentSession.generateSessionData();

  PaymentsAPI api = PaymentsAPI();

  try{
    Map sessionData = await api.generateSessionRequest(theGeneratedSession);
    if(sessionData["success"]){
      print('generating session was success');
      // String thawaniPublishableKey = "jXejEJYYbW6mw1YOl6BDLzgQiVqPjz";
      String thawaniPublishableKey = "HGvTMLDssJghr9tlN9gr4DVYt0qyBy";
      String session_id = sessionData["data"]["session_id"];

      final Uri uri = Uri(scheme: 'https', host: 'uatcheckout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
      // final Uri uri = Uri(scheme: 'https', host: 'checkout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});

      print("structured url => $uri");
      var response = await launchUrl(uri, mode: LaunchMode.inAppWebView);
      print("This is response from launch url => $response");
      // if(await canLaunchUrl(uri)){
      //   print("url was launched with condition");
      //   await launchUrl(uri);
      // }
    }
  }catch(e){
    print("Erorr payment");
  }

  print("this is route name => $routeName");

}

