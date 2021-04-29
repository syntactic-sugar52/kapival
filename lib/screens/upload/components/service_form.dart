import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceForm extends StatelessWidget {
  final double width;
  final skillController;
  final descriptionController;
  final priceController;
  final value;
  final onPress;
  // final priceVal;
  final categoryController;
  final lookingForController;
  Function onChanged;

  ServiceForm(
      {this.width,
      this.skillController,
      this.onChanged,
      this.value,
      this.onPress,
      // this.priceVal,
      this.categoryController,
      this.descriptionController,
      this.lookingForController,
      this.priceController});

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
  Widget get buildServiceForm => Container(
        // color: Colors.blueGrey,
        child: Card(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                child: Text(
                  "Service Form",
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
                  "Skill : ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                title: Container(
                  width: width,
                  height: 45,
                  child: TextField(
                    controller: skillController,
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
                          color: Colors.black,
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
                height: 10,
              ),
              ExpansionTile(
                title: Text(
                  "Price: ",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                children: [
                  // Container(
                  //   padding: const EdgeInsets.only(left: 60),
                  //   child: Text("How much do you want for it?"),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Text(
                      "Amount",
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    title: Container(
                      // padding: const EdgeInsets.only(
                      //     left: 50, right: 50, top: 30, bottom: 30),
                      width: 20,
                      height: 45,
                      child: TextField(
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("OR"),
                  SizedBox(
                    height: 20,
                  ),

                  ListTile(
                    leading: Text(
                      "Looking for: ",
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    title: Container(
                      width: width,
                      height: 45,
                      child: TextField(
                        controller: lookingForController,
                        decoration: new InputDecoration(
                          hintText: "What do you want for it ?",
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
    return buildServiceForm;
  }
}
