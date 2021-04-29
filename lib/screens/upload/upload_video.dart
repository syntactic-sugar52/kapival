import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kap/dashboard/dahsboard.dart';
import 'package:kap/models/product_model/product_model.dart';
import 'package:kap/models/referral_model.dart';
import 'package:kap/models/service_model/service_model.dart';
import 'package:kap/services/database.dart';
import 'package:kap/services/storage_service.dart';
import 'package:kap/states/current_user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'components/information_form.dart';
import 'components/investment_form.dart';
import 'components/product_form.dart';
import 'components/referral_form.dart';
import 'components/service_form.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File _image;
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _lookingForController = TextEditingController();
  TextEditingController _skillController = TextEditingController();

  bool _isLoading = false;

  final Uuid _uuid = Uuid();

  _showSelectImageDialog() {
    return Platform.isIOS ? _iosBottomSheet() : _androidDialog();
  }

  _iosBottomSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Add Photo'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Take Photo'),
              onPressed: () {
                _handleImage(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Choose From Gallery'),
              onPressed: () {
                _handleImage(ImageSource.gallery);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  _androidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Add Photo'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Take Photo'),
              onPressed: () {
                _handleImage(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
              child: Text('Choose From Gallery'),
              onPressed: () {
                _handleImage(ImageSource.gallery);
              },
            ),
            SimpleDialogOption(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  var image;

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    final _picker = ImagePicker();
    PickedFile imageFile = await _picker.getImage(source: source);
    if (imageFile != null) {
      image = await _cropImage(File(imageFile.path));
      setState(() {
        _image = image;
      });
    }
  }

  _cropImage(File imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    return croppedImage;
  }

  List<String> _cardType = [
    'Product',
    'Service',
    'Information',
    'Referral',
    'Investment'
  ];

  String _selectedType;

  _submit(context) async {
    CurrentUser _user = Provider.of<CurrentUser>(context, listen: false);
    if (!_isLoading && _image != null) {
      setState(() {
        _isLoading = true;
      });

      // Create post
      StorageService.uploadPost(_image, _user.uid);

      if (_selectedType == "Product") {
        var prodId = _uuid.v4();
        ProductModel productModel = ProductModel(
            upvote: 0,
            description: _descriptionController.text.trim(),
            item: _itemController.text.trim(),
            category: _categoryVal.trim(),
            imageUrl: _image.path.trim(),
            downvote: 0,
            brand: _brandController.text.trim(),
            reviews: {},
            productId: prodId,
            comments: {},
            createdAt: Timestamp.fromDate(DateTime.now()),
            price: _priceController.text.trim(),
            lookingFor: _lookingForController.text.trim());

        await Database().createProduct(productModel, prodId, _user.postId,
            _user.currentUser.firstName, _user.currentUser.lastName, _user.uid);

        // Reset data
        _itemController.clear();
        _lookingForController.clear();
        _skillController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _categoryController.clear();
        _brandController.clear();
        _aboutController.clear();

        setState(() {
          _image = null;
          _isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      } else if (_selectedType == "Service") {
        var serviceId = _uuid.v4();
        Service serviceModel = Service(
            upvote: 0,
            description: _descriptionController.text.trim(),
            skill: _skillController.text.trim(),
            category: _categoryVal.trim(),
            imageUrl: _image.path.trim(),
            downvote: 0,
            reviews: {},
            serviceId: serviceId,
            comments: {},
            createdAt: Timestamp.fromDate(DateTime.now()),
            price: _priceController.text.trim(),
            lookingFor: _lookingForController.text.trim());

        await Database().createService(serviceModel, serviceId, _user.postId,
            _user.currentUser.firstName, _user.currentUser.lastName, _user.uid);

        // Reset data
        _lookingForController.clear();
        _skillController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _categoryController.clear();

        setState(() {
          _image = null;
          _isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      } else if (_selectedType == "Referral") {
        var referralId = _uuid.v4();
        Referral refModel = Referral(
            upvote: 0,
            description: _descriptionController.text.trim(),
            about: _aboutController.text.trim(),
            category: _categoryVal.trim(),
            imageUrl: _image.path.trim(),
            downvote: 0,
            reviews: {},
            referralId: referralId,
            comments: {},
            createdAt: Timestamp.fromDate(DateTime.now()),
            price: _priceController.text.trim(),
            lookingFor: _lookingForController.text.trim());

        await Database().createReferral(refModel, referralId, _user.postId,
            _user.currentUser.firstName, _user.currentUser.lastName, _user.uid);

        // Reset data
        _lookingForController.clear();

        _aboutController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _categoryController.clear();

        setState(() {
          _image = null;
          _isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      }
    }
  }

  String _categoryVal;

  int radioVal;
  buildCard(selectedType) {
    switch (selectedType) {
      case 'Product':
        return ProductForm(
          width: MediaQuery.of(context).size.width * 0.8,
          itemController: _itemController,
          descriptionController: _descriptionController,
          lookingForController: _lookingForController,
          categoryController: _categoryController,
          priceController: _priceController,
          brandController: _brandController,
          radioVal: radioVal,
          radioChanged: (value) {
            setState(() {
              radioVal = value;
            });
            print(radioVal);
          },
          value: _categoryVal,
          onChanged: (value) {
            setState(() {
              _categoryVal = value;
            });
          },
        );

        break;
      case 'Service':
        return ServiceForm(
          width: MediaQuery.of(context).size.width * 0.8,
          skillController: _skillController,
          descriptionController: _descriptionController,
          lookingForController: _lookingForController,
          priceController: _priceController,
          categoryController: _categoryController,
          value: _categoryVal,
          onChanged: (value) {
            setState(() {
              _categoryVal = value;
            });
          },
        );
        break;
      case 'Information':
        return InformationForm(
          width: MediaQuery.of(context).size.width * 0.8,
          aboutController: _aboutController,
          descriptionController: _descriptionController,
          priceController: _priceController,
          categoryController: _categoryController,
          lookingForController: _lookingForController,
        );
        break;
      case 'Referral':
        return ReferralForm(
          width: MediaQuery.of(context).size.width * 0.8,
          aboutController: _aboutController,
          descriptionController: _descriptionController,
          priceController: _priceController,
          lookingForController: _lookingForController,
          categoryController: _categoryController,
          value: _categoryVal,
          onChanged: (value) {
            setState(() {
              _categoryVal = value;
            });
          },
        );
        break;
      case 'Investment':
        return InvestmentForm(
          width: MediaQuery.of(context).size.width * 0.8,
          aboutController: _aboutController,
          descriptionController: _descriptionController,
          priceController: _priceController,
          lookingForController: _lookingForController,
          categoryController: _categoryController,
        );
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Post',
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_outlined,
              color: Colors.red.shade800,
            ),
            onPressed: () {
              _submit(context);
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Column(
                children: <Widget>[
                  _isLoading
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.blueGrey,
                            valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                          ),
                        )
                      : SizedBox.shrink(),
                  GestureDetector(
                    onTap: _showSelectImageDialog,
                    child: Container(
                      height: width,
                      width: width,
                      color: Colors.grey[300],
                      child: _image == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.white70,
                              size: 150.0,
                            )
                          : Image(
                              image: FileImage(_image),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.greenAccent,
                        border: Border.all()),
                    child: DropdownButton(
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      hint: Text(
                        'What are you offering?',
                        style: GoogleFonts.roboto(),
                      ),
                      value: _selectedType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedType = newValue;
                        });
                      },
                      items: _cardType.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildCard(_selectedType),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
