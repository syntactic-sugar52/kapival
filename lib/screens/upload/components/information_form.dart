import 'package:flutter/material.dart';

class InformationForm extends StatelessWidget {
  final double width;
  final aboutController;
  final descriptionController;
  final priceController;
  final categoryController;
  final lookingForController;
  Function onChanged;
  InformationForm(
      {@required this.width,
      @required this.aboutController,
      @required this.categoryController,
      @required this.onChanged,
      @required this.descriptionController,
      @required this.lookingForController,
      @required this.priceController});
  String _selected = 'Private';
  Widget get buildInformationForm => Card(
        child: ExpansionTile(
          title: Text(
            "Information",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              leading: Radio(
                value: 'male',
                groupValue: _selected,
                onChanged: onChanged,
              ),
              title: Text('Private'),
            ),
            ListTile(
              leading: Radio(
                value: 'female',
                groupValue: _selected,
                onChanged: onChanged,
              ),
              title: Text('Public'),
            ),
            SizedBox(height: 25),
            Text(_selected == 'Private' ? 'Private' : 'Public'),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Text("About : "),
              title: Container(
                width: width,
                height: 45,
                child: TextField(
                  controller: aboutController,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text("Description: "),
              title: Container(
                width: width,
                // width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  cursorColor: Colors.grey,
                  maxLines: 5,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  controller: descriptionController,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
                leading: Text("Price : "),
                title: Container(
                  width: width,
                  height: 45,
                  child: TextField(
                    controller: priceController,
                    // controller: _brandController,
                    decoration: new InputDecoration(
                      // hintText: '1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text("Looking For: "),
              title: Container(
                width: width,
                height: 55,
                child: TextField(
                  maxLines: 3,
                  controller: lookingForController,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text("cateogry"),
              title: Container(
                width: width,
                // width: MediaQuery.of(context).size.width * 0.8,
                height: 45,
                child: TextField(
                  controller: categoryController,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return buildInformationForm;
  }
}
