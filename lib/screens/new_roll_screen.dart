import 'package:flutter/material.dart';

import '../models/roll_data.dart';
import '../models/roll.dart';

class NewRollScreen extends StatefulWidget {
  @override
  _NewRollScreenState createState() => _NewRollScreenState();
}

class _NewRollScreenState extends State<NewRollScreen> {
  String dropdownValue = '35mm';

  final titleController = TextEditingController();
  final stockController = TextEditingController();
  final isoController = TextEditingController();
  String title;
  String stock;
  int iso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        title: Text('Create new roll'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Container(
          child: Form(
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildFormTitle(),
                    _buildFormStock(),
                    _buildFormISO(),
                    // _buildForm('Film size'),
                    DropdownButton(
                      value: dropdownValue,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['35mm', '120', '4x5', '8x10']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36),
                      child: ElevatedButton(
                        onPressed: () {
                          Roll r = new Roll(
                              id: 'test',
                              title: titleController.text,
                              filmStock: stockController.text,
                              iso: int.parse(isoController.text),
                              filmSize: dropdownValue,
                              photos: null);
                          dummyRolls.add(r);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        validator: (value) => value.isEmpty ? "Title cannot be empty" : null,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: 'Title',
        ),
        scrollPhysics: BouncingScrollPhysics(),
        textCapitalization: TextCapitalization.sentences,
        controller: titleController,
      ),
    );
  }

  Widget _buildFormStock() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        validator: (value) =>
            value.isEmpty ? "Film stock cannot be empty" : null,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: 'Film stock',
          hintText: 'Kodak Portra',
        ),
        scrollPhysics: BouncingScrollPhysics(),
        textCapitalization: TextCapitalization.sentences,
        controller: stockController,
      ),
    );
  }

  Widget _buildFormISO() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        validator: (value) => value.isEmpty ? "ISO cannot be empty" : null,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: 'ISO',
          hintText: '400',
        ),
        keyboardType: TextInputType.number,
        scrollPhysics: BouncingScrollPhysics(),
        controller: isoController,
      ),
    );
  }
}
