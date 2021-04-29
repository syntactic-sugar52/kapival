import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final DateTime selectedDate;
  final Function onChanged;
  final Function onPressed;
  CustomDialog({this.onChanged, this.onPressed, this.selectedDate});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text("Your Birthday",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 25,
                ),
                DatePickerWidget(
                  looping: false, // default is not looping
                  firstDate: DateTime(1990, 01, 01),
                  lastDate: DateTime(2030, 1, 1),
                  initialDate: DateTime(1991, 10, 12),
                  dateFormat: "MMM-dd-yyyy",
                  locale: DatePicker.localeFromString('en'),
                  onChange: onChanged,
                  pickerTheme: DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 17),
                    dividerColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: 9.0, bottom: 20.0, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0)),
                  ),
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey
                                  // Color(0XFFEFEE81)
                                  // Color(0XFFA1CF48)
                                  )),
                      child: Text(
                        "OK",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ))
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
