import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Linking Example',
      onGenerateRoute: (settings) {
        // Handle the deep link and navigate to the appropriate screen
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) => DetailsPage());
        }
        return MaterialPageRoute(builder: (context) => HomePage());
      },
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
        child: Text('This is the details page.'),
      ),
    );
  }
}

Future<void> _launchURL(BuildContext context, String routeName) async {
  final url = Uri.parse('myghzlahapp://$routeName'); // Use your app's custom URL scheme
  print("this is route name => $routeName");
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  } else {
    throw 'Could not launch $url';
  }
}
