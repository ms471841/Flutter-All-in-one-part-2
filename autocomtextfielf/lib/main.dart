import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(border: OutlineInputBorder())),
          suggestionsCallback: (pattern) async {
            return await BackendService.getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(suggestion['name']),
              subtitle: Text('\$${suggestion['price']}'),
            );
          },
          onSuggestionSelected: (suggestion) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductPage(product: suggestion)));
          },
        ),
      ),
    );
  }
}
