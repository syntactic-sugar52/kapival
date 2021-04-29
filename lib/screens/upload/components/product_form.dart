import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:animated_radio_buttons/animated_radio_buttons.dart';

class ProductForm extends StatelessWidget {
  final double width;
  final itemController;
  final brandController;
  final value;
  final radioChanged;
  final onPress;
  final radioVal;
  final priceEnable;
  final descriptionController;
  final lfEnable;
  Function onChanged;
  final priceController;
  final categoryController;
  final lookingForController;
  ProductForm(
      {@required this.width,
      @required this.onChanged,
      @required this.itemController,
      @required this.brandController,
      this.onPress,
      this.priceEnable,
      this.radioVal,
      this.lfEnable,
      this.radioChanged,
      this.value,
      @required this.categoryController,
      @required this.descriptionController,
      @required this.lookingForController,
      @required this.priceController});
  List<String> _category = [
    'Arts and Crafts',
    'Automotive',
    'Baby',
    'Beauty and personal care',
    'Computers',
    'Electronics',
    'Fashion',
    'Health and Household',
    'Home and Kitchen',
    'Industrial and Scientific',
    'Movies and Television',
    'Pet supplies',
    'Software',
    'Sports and Outdoors',
    'Smart Home',
    'Tools & Home Improvement',
    'Toys and Games',
    'Video Games',
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "CryptoCurrency",
    "Education"
  ];

  Widget get amount => ListTile(
        leading: Text(
          "Amount",
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        title: Container(
          width: 20,
          height: 45,
          child: TextField(
            enabled: priceEnable,
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
              hintText: "How much do you want for it?",
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
      );

  Widget get lf => ListTile(
        leading: Text(
          "Looking for: ",
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        title: Container(
          width: width,
          height: 45,
          child: TextField(
            enabled: lfEnable,
            controller: lookingForController,
            decoration: new InputDecoration(
              hintText: "What do you want for it ?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(5.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.greenAccent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get textfield => Container(
        // color: Colors.blueGrey,
        child: Card(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                child: Text(
                  "Product Form",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListTile(
                leading: Text(
                  "Item: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                title: Container(
                  width: width,
                  height: 45,
                  child: TextFormField(
                    controller: itemController,
                    // autovalidateMode: true,

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
                leading: Text(
                  "Brand: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                title: Container(
                  width: width,
                  height: 45,
                  child: TextField(
                    controller: brandController,
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
                leading: Text(
                  "Description: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                title: Container(
                  width: width,
                  child: TextField(
                    cursorColor: Colors.grey,
                    maxLines: 10,

                    decoration: new InputDecoration(
                      // hintText: '1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.greenAccent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    controller: descriptionController,
                    // controller: _descriptionController,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Price: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: AnimatedRadioButtons(
                  value: radioVal,
                  animationCurve: Curves.easeInOutSine,
                  layoutAxis: Axis.horizontal,
                  buttonRadius: 30.0,
                  items: [
                    AnimatedRadioButtonItem(
                        label: "Amount",
                        color: Colors.blueGrey,
                        fillInColor: Colors.white54),
                    AnimatedRadioButtonItem(
                        label: "Looking For",
                        color: Colors.blueGrey,
                        fillInColor: Colors.green.shade500)
                  ],
                  onChanged: radioChanged,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              radioVal == 0 ? amount : lf,
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Text(
                  "Category: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: width,
                    height: 45,
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: Colors.blueGrey,
                        border: Border.all()),
                    child: DropdownButton(
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      hint: Text('Select Category'),
                      value: value,
                      onChanged: onChanged,
                      items: _category.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return textfield;
  }
}
