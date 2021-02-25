import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String _name;
  String _email;
  String _roll;
  String _phone;
  String _reason;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 12,
      validator: (String value){
        if(value.isEmpty)
        return 'Name is Required';
      return null;
      },
      onSaved: (String value){
        _name=value;
      },
    );
  }

 Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }


  Widget _buildRollField() {
return TextFormField(
      decoration: InputDecoration(labelText: 'Roll'),
      validator: (String value){
        if(value.isEmpty)
        return 'Roll is Required';
        return null;
      },
      onSaved: (String value){
        _roll=value;
      },
    );  }

  Widget _buildPhoneField() {
return TextFormField(
      decoration: InputDecoration(labelText: 'Phone'),
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty)
        return 'Phone is Required';
        return null;
      },
      onSaved: (String value){
        _phone=value;
      },
    );  }

  Widget _buildReasonField() {
return TextFormField(
      decoration: InputDecoration(labelText: 'Reason'),
      validator: (String value){
        if(value.isEmpty)
        return 'Reason is Required';
        return null;
      },
      onSaved: (String value){
        _reason=value;
      },
    );  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNameField(),
                _buildEmailField(),
                _buildRollField(),
                _buildPhoneField(),
                _buildReasonField(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if(!_formKey.currentState.validate()){
                      return;
                    }

                    _formKey.currentState.save();
                    print(_name);
                    print(_email);
                    print(_roll);
                    print(_phone);
                    print(_reason);




                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
