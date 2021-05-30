import 'package:f_provider/utils/providers/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  @override
  createState() => _Login();

}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "登入",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Text("帳號"),
                ),
                Flexible(
                  flex: 7,
                  child: Consumer<LoginNotifier>(builder: (context, login, _) {
                    return TextFormField(
                      decoration: InputDecoration(
                        errorText: login.accountErrorMsg,
                      ),
                      onChanged: (String text) {
                        Provider.of<LoginNotifier>(
                          context,
                          listen: false,
                        ).accountValidating(
                          fieldValue: text,
                        );
                      },
                    );
                  },),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Text("密碼"),
                ),
                Flexible(
                  flex: 7,
                  child: Consumer<LoginNotifier>(
                    builder: (context, login, _,) {
                      return TextFormField(
                        decoration: InputDecoration(
                          errorText: login.passwordErrorMsg,
                        ),
                        onChanged: (String text) {
                          Provider.of<LoginNotifier>(
                            context,
                            listen: false,
                          ).passwordValidating(
                            fieldValue: text,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Consumer<LoginNotifier>(
              builder: (context, login, _ ,) {
                return ElevatedButton(
                  onPressed: (login.accountValid && login.passwordValid) ? () {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                            '可以登入了!!',
                          ),
                        ),
                      );
                  } : null,
                  child: Text(
                    "登入",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
