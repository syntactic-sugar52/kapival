import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderDialog extends StatelessWidget {
  Function malePressed;
  Function femalePressed;
  Function lgbtPressed;
  Function secretPressed;
  GenderDialog(
      {this.femalePressed,
      this.lgbtPressed,
      this.malePressed,
      this.secretPressed});
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
                  child: Text("Your Gender",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
                      onPressed: malePressed,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey
                                  // Color(0XFFEFEE81)
                                  // Color(0XFFA1CF48)
                                  )),
                      child: Text(
                        "Male",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
                      onPressed: femalePressed,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueGrey)),
                      child: Text(
                        "Female",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
                      onPressed: lgbtPressed,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueGrey)),
                      child: Text(
                        "LGBTQ",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
                      onPressed: secretPressed,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueGrey)),
                      child: Text(
                        "Prefer not to specify",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
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
