import 'package:flutter/material.dart';
import 'package:flutter_challenge/components/Helper.dart';
import 'package:flutter_challenge/components/custom_button.dart';
import 'package:flutter_challenge/components/entry_field.dart';
import 'package:flutter_challenge/config/Locale/locales.dart';
import 'package:flutter_challenge/pages/jokes_page.dart';
import 'package:flutter_challenge/routes/routes.dart';
import 'package:flutter_challenge/utils/app_constants.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  FocusNode firstNameNode = FocusNode(), lastNameNode = FocusNode();
  String firstName = '', lastName = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppConstants.white,
        title: Text(
          'Please Enter your Details',
          style: AppConstants.customStyle(
            color: AppConstants.black,
            style: FontStyle.italic,
            size: 15.0,
            weight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          EntryField(
            label: locale.firstNameText,
            hint: locale.firstNameHint,
            keyboardType: TextInputType.name,
            node: firstNameNode,
            textInputAction: TextInputAction.next,
            onSubmitted: (text) {
              FocusScope.of(context).requestFocus(lastNameNode);
            },
            onChanged: (text) {
              setState(() {
                firstName = text;
              });
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          EntryField(
            label: locale.lastNameText,
            hint: locale.lastNameHint,
            keyboardType: TextInputType.name,
            node: lastNameNode,
            textInputAction: TextInputAction.done,
            onChanged: (text) {
              setState(() {
                lastName = text;
              });
            },
          ),
          CustomButton(
            radius: BorderRadius.all(
              Radius.circular(6.0),
            ),
            loading: loading,
            padding: 16.0,
            color: AppConstants.primaryColor,
            onPressed: firstName.isNotEmpty && lastName.isNotEmpty
                ? () async {
                    setState(() {
                      loading = true;
                    });
                    Map<String, dynamic> json = {
                      "firstName": firstName,
                      "lastName": lastName,
                    };
                    print('Saved Json: $json');
                    await Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => JokesPage(
                              data: json,
                            ),
                            settings: RouteSettings(name: Routes.jokesPage),
                          ),
                        )
                        .then((value) => setState(() => loading = false));
                  }
                : () {
                    Helper.showToast(
                      context: context,
                      text: 'Please Fill First Name and Last Name',
                    );
                  },
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
