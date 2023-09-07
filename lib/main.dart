import 'package:deeplinking_with_thawani/router.dart';
import 'package:deeplinking_with_thawani/thawani/thawani_cart_item.dart';
import 'package:deeplinking_with_thawani/thawani/thawani_payment_api.dart';
import 'package:deeplinking_with_thawani/thawani/thawani_payment_session.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Deep Linking Example',
      routerConfig: router,
    );
  }
}

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
            _launchURL(context, '/details');
          },
          child: const Text('Open Details Page'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

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

  // final url = Uri.parse('https://myghzlahapp.com$routeName');

  //Costum scheme app link
  final url = Uri.parse('costum://$routeName');

  final paymentSession = ThawaniPaymentSession(<ThawaniCartItem>[], "123", "First Name");

  final theGeneratedSession = paymentSession.generateSessionData();

  PaymentsAPI api = PaymentsAPI();

  // try{
  //   Map sessionData = await api.generateSessionRequest(theGeneratedSession);
  //   if(sessionData["success"]){
  //     print('generating session was success');
  //     // String thawaniPublishableKey = "jXejEJYYbW6mw1YOl6BDLzgQiVqPjz";
  //     String thawaniPublishableKey = "HGvTMLDssJghr9tlN9gr4DVYt0qyBy";
  //     String session_id = sessionData["data"]["session_id"];
  //
  //     final Uri uri = Uri(scheme: 'https', host: 'uatcheckout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
  //     // final Uri uri = Uri(scheme: 'https', host: 'checkout.thawani.om', path: 'pay/$session_id', queryParameters: {'key': thawaniPublishableKey});
  //
  //     print("structured url => $uri");
  //     var response = await launchUrl(uri, mode: LaunchMode.inAppWebView);
  //     print("This is response from launch url => $response");
  //     // if(await canLaunchUrl(uri)){
  //     //   print("url was launched with condition");
  //     //   await launchUrl(uri);
  //     // }
  //   }
  // }catch(e){
  //   print("Erorr payment");
  // }

  print("this is route name => $routeName");
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  } else {
    throw 'Could not launch $url';
  }
}
