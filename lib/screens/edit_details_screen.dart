import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/providers/orders.dart';
import 'package:rent_app/providers/user.dart';
import 'package:rent_app/widgets/enter_details_form.dart';

class EditDetailsScreen extends StatefulWidget {
  static const routeName = 'edit-details';
  @override
  _EditDetailsScreenState createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  var _user;
  Future<void> saveForm(User editedUser) async {
    _user = Provider.of<Orders>(context).user;
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Orders>(context, listen: false).updateUser(editedUser);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
      ),
      body: EnterDetailsForm(
        form: _form,
        saveForm: saveForm,
        editedUser: _user,
      ),
    );
  }
}
