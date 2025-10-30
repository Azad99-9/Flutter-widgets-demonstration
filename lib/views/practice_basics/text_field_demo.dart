import 'package:first_project/utils/validators.dart';
import 'package:flutter/material.dart';

  final _formKey = GlobalKey<FormState>();


class BasicTextFieldDemo extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'enter your name here azad',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.name,
          onChanged: (value) {
            print('Typed: $value');
          },
          onSubmitted: (value) {
            print('Submitted: $value');
          },
        ),
      ),
    );
  }
}

class ControllerExample extends StatefulWidget {
  @override
  State<ControllerExample> createState() => _ControllerExampleState();
}

class _ControllerExampleState extends State<ControllerExample> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose(); // Always dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controller Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email address',
    prefixIcon: Icon(Icons.email),
    suffixIcon: Icon(Icons.check_circle_outline),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
  ),

            ),
            ElevatedButton(
              onPressed: () {
                print('User entered: ${_nameController.text}');
                _nameController.clear();
              },
              child: Text('Print Value'),
            ),
          ],
        ),
      ),
    );
  }
}

class FocusExample extends StatefulWidget {
  @override
  State<FocusExample> createState() => _FocusExampleState();
}

class _FocusExampleState extends State<FocusExample> {
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    FocusScope.of(context).requestFocus(_secondFocus);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _firstFocus.dispose();
    _secondFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              focusNode: _firstFocus,
              decoration: InputDecoration(labelText: 'First Name'),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(_secondFocus),
            ),
            TextField(
              focusNode: _secondFocus,
              decoration: InputDecoration(labelText: 'Last Name'),
              onSubmitted: (value) => FocusScope.of(context).requestFocus(_firstFocus) ,
            ),
          ],
        ),
      ),
    );
  }
}


class FormExample extends StatefulWidget {
  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  Validators.validateEmail(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                validator: (value) {
                  Validators.validatePassword(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted!')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LiveCharacterCount extends StatefulWidget {
  @override
  State<LiveCharacterCount> createState() => _LiveCharacterCountState();
}

class _LiveCharacterCountState extends State<LiveCharacterCount> {
  String _text = ''; //qss

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Character Count')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => _text = value),
              decoration: InputDecoration(labelText: 'Type something'),
            ),
            SizedBox(height: 10),
            Text('Characters: ${_text.length}'),
          ],
        ),
      ),
    );
  }
}

class SaveFormExample extends StatefulWidget {
  @override
  State<SaveFormExample> createState() => _SaveFormExampleState();
}

class _SaveFormExampleState extends State<SaveFormExample> {
  String? _email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Save Form Example', style: Theme.of(context).textTheme.bodyLarge,)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                   Validators.validateEmail(value);
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                                obscureText: true,

                decoration: InputDecoration(labelText: 'password'),
                validator: (value) {
                   Validators.validatePassword(value);
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                   Validators.validateEmail(value);
                },
                onSaved: (value) => _email = value,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Saved Email: $_email');
                  }
                },
                child: Text('Save & Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
