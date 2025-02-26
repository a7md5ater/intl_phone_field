import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Field Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  pickerDialogStyle: PickerDialogStyle(
                      searchFieldPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      searchFieldCursorHeight: 18,
                      searchFieldCursorColor: Colors.black,
                      searchFieldInputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),

                        suffixIcon: Icon(Icons.search),
                        hintText: "Search",
                        // Use enabledBorder for the normal state
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                        // Use focusedBorder for when the field is selected/focused
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                        // You can also set the border for when there's an error
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(10)),
                        // The border property alone isn't sufficient to control all states
                        // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      )),
                  languageCode: "en",
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  child: const Text('Submit'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
