import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LoginPageForm extends StatefulWidget {
  @override
  _LoginPageFormState createState() => new _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> implements LoginScreenContract {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  LoginScreenPresenter _presenter;

  String _email;
  String _password;
  bool _isLoading = false;

  _LoginPageFormState(){
    print("Constructor is getting call");
    _presenter= new LoginScreenPresenter(this);
    _presenter.doLogin("djfj", "djsfk");
  }

  void _submit() {
    print("Validate Form is called");
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() {
    setState(() => _isLoading = true);
    _presenter.doLogin(_email, _password);
  }

  void _showSnackbar(String text){
        final snackbar =
        new SnackBar(content: new Text(text));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Login page'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Email id"),
                  validator: (val) =>
                      !val.contains('@') ? 'Invalid email' : null,
                  onSaved: (val) => _email = val,
                ),
                new TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (val) =>
                      val.length < 6 ? 'Password is too sort' : null,
                  onSaved: (val) => _password = val,
                ),
                new Padding(padding: const EdgeInsets.all(50.0)),

                _isLoading? new CircularProgressIndicator() :
                new RaisedButton(
                  onPressed: _submit,
                  child: new Text("Submit"),
                )
              ],
            )),
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    print("error "+errorTxt);
    setState(() => _isLoading = false);
    _showSnackbar("Error occur");
  }

  @override
  void onLoginSuccess(User user) {
    print("User Object recived ---------------");
    setState(() => _isLoading = false);
    _showSnackbar("Login success");
  }
}

class User{

  User({this.userId, this.name});
  String userId;
  String name;

  User.map(dynamic obj) {
    this.userId = obj["user_id"];
    this.name = obj["name"];
  }

}

class LoginModel {
  String _username;
  String _password;
  LoginModel(this._username, this._password);

  LoginModel.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }
}

class NetworkUtil{
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

}

class RestDataSource{
  NetworkUtil _networkUtil = new NetworkUtil();
  static final BASE_URL = "http://demo5762353.mockable.io/";
  static final LOGIN_URL = BASE_URL + "login";

  Future<User> login(String userName, String password){
    print("calling the login api");
    return _networkUtil.post(LOGIN_URL,body: {
      userName: userName,
      password: password
    }).then((dynamic res){
      print(res.toString());
      if(res["error"]) throw new Exception("Error occur");
      return new User.map(res);
    });
  }
}

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDataSource api = new RestDataSource();
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((Exception error) => _view.onLoginError(error.toString()));
  }
}

