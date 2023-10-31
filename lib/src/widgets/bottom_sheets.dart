import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privateinsta/core/constants/colors.dart';
import 'package:privateinsta/core/utils/phone_number.dart';
import 'package:privateinsta/src/widgets/buttons.dart';

class BottomSheets {
  BottomSheets({required this.context, this.child});
  final BuildContext context;
  final Widget? child;

  void menuBottomSheets() {
    showModalBottomSheet<int>(
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      const ListTile(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(indent: 100),
                  itemCount: 13,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<PhoneNumber?> countryCodeBottomSheets() {
    return showModalBottomSheet<PhoneNumber>(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.black,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PITextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel'),
                ).basic(),
                const Spacer(),
                const Text(
                  'Select Country',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pop(PhoneNumber.countriesPhoneNumberCodes[index]);
                  },
                  title: Text(
                    PhoneNumber.countriesPhoneNumberCodes[index].countryName ??
                        'India',
                  ),
                  trailing: Text(
                    PhoneNumber.countriesPhoneNumberCodes[index].countryCode ??
                        '+91',
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  indent: 10,
                  color: AppColors.grey,
                ),
                itemCount: PhoneNumber.countriesPhoneNumberCodes.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Future<File?> chooseImageBottomSheet() {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () async {
              try {
                final XFile? image =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                if (context.mounted && image != null) {
                  final File imageTemp = File(image.path);
                  Navigator.pop(context, imageTemp);
                }
              } on PlatformException catch (e) {
                log('Failed to pick image: $e');
                return;
              }
            },
            child: const Text('take a photo'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              try {
                final XFile? image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (context.mounted && image != null) {
                  final File imageTemp = File(image.path);
                  Navigator.pop(context, imageTemp);
                }
              } on PlatformException catch (e) {
                log('Failed to pick image: $e');
                return;
              }
            },
            child: const Text('pick gallery'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('cancel'),
        ),
      ),
    );
  }
}
