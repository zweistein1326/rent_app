import 'package:flutter/material.dart';
import 'package:rent_app/providers/orders.dart';
import '../providers/user.dart';
import 'package:provider/provider.dart';

class EnterDetailsForm extends StatefulWidget {
  @override
  _EnterDetailsFormState createState() => _EnterDetailsFormState();
}

class _EnterDetailsFormState extends State<EnterDetailsForm> {
  final _form = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  var _editedUser = User(
    name: '',
    contact: '',
    address: '',
  );

  var _initValues = {
    'name': '',
    'contact': '',
    'address': '',
  };
  var _isInit = true;
  var _isLoading = false;

  void dispose() {
    _nameFocusNode.dispose();
    _contactFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _editedUser = Provider.of<Orders>(context, listen: false).user;
      if (_editedUser != null) {
        _initValues = {
          'name': _editedUser.name,
          'contact': _editedUser.contact,
          'address': _editedUser.address,
        };
      }
    }
    _isLoading = false;
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> saveForm() async {
    final isValid = _form.currentState.validate();
    _form.currentState.save();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Orders>(context).updateUser(_editedUser);
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      // child: Column(
      //   children: <Widget>[
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      initialValue: _initValues['name'],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_contactFocusNode);
                      },
                      focusNode: _nameFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = User(
                          name: value,
                          contact: _editedUser.contact,
                          address: _editedUser.address,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      initialValue: _initValues['contact'],
                      decoration: InputDecoration(labelText: 'Contact'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_addressFocusNode);
                      },
                      focusNode: _contactFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid phone number';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = User(
                          name: _editedUser.name,
                          contact: value,
                          address: _editedUser.address,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      initialValue: _initValues['address'],
                      decoration: InputDecoration(labelText: 'Address'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      focusNode: _addressFocusNode,
                      onFieldSubmitted: (_) {},
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide your address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedUser = User(
                          name: _editedUser.name,
                          contact: _editedUser.contact,
                          address: value,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ButtonTheme(
                      height: MediaQuery.of(context).size.height * 0.08,
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.done),
                        label: Text('Confirm'),
                        color: Theme.of(context).primaryColor,
                        onPressed: saveForm,
                      ),
                    ),
                  )
                ],
              ),
            ),
      // FlatButton.icon(
      //   icon: Icon(Icons.save),
      //   label: Text('Save'),
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('/products-screen');
      //   },
      // )
      // ],
      // ),
    );
  }
}
