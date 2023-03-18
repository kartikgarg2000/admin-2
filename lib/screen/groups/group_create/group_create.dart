import 'dart:convert';
import 'dart:html';

import 'package:agrishot_admin/screen/groups/group_create/api_post.dart';
import 'package:agrishot_admin/screen/groups/group_veiw/group_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Theme/border.dart';
import '../../../Theme/text_style.dart';
import 'model/group_post_model.dart';

class GroupCreate extends StatefulWidget {
  GroupCreate({Key? key}) : super(key: key);

  @override
  State<GroupCreate> createState() => _GroupCreateState();
}

class _GroupCreateState extends State<GroupCreate> {
  String groupUserType = '';
  String groupType = '';
  TextEditingController userTypeController = TextEditingController();
  TextEditingController moderatorController = TextEditingController();

  TextEditingController aboutGroupController = TextEditingController();

  TextEditingController trialController = TextEditingController();

  TextEditingController groupRulesController = TextEditingController();

  bool isPaid = false;

  List<String> userTypeList = [
    "STUDENT",
    "FARMER",
    "TRADER",
    "BUSSINESS",
  ];

  List<String> groupTypeList = [
    "INFORMATIONAL",
    "FEEDS",
    "BUY",
    "SELL",
  ];
  Uint8List webImage = Uint8List(8);
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDFE0EB), width: 2),
          color: const Color(0xffFFFFFF),
        ),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'New Groups',
                            style: newGroupsTextStyle.copyWith(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Group User Type",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFFD1D1D1), width: 1)),
                            child: DropdownButton(
                              value: groupUserType == '' ? null : groupUserType,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: userTypeList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(items),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  groupUserType = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Group Name",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFFD1D1D1), width: 1)),
                            child: TextFormField(
                              controller: userTypeController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontWeight: FontWeight.w400,
                                ),
                                // fillColor: ,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Group Type",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFFD1D1D1), width: 1)),
                            child: DropdownButton(
                              value: groupType == '' ? null : groupType,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: groupTypeList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(items),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  groupType = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Upload Image",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: Color(0xFF1D8D2F), width: 1)),
                                  child: Center(
                                    child: Icon(Icons.file_upload_outlined,
                                        color: Color(0xFF1D8D2F)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              _pickedImage != null
                                  ? Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Color(0xFF1D8D2F),
                                              width: 1)),
                                      child: Image.memory(
                                        webImage,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 100,
                                      width: 100,
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Moderator",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFFD1D1D1), width: 1)),
                            child: TextFormField(
                              controller: moderatorController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'Moderator Name',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontWeight: FontWeight.w400,
                                ),
                                // fillColor: ,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFFD1D1D1), width: 1)),
                            child: TextFormField(
                              controller: aboutGroupController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'About Group',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontWeight: FontWeight.w400,
                                ),
                                // fillColor: ,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Paid group',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPaid = !isPaid;
                                  });
                                },
                                icon: isPaid == true
                                    ? Icon(Icons.check_box_outlined,
                                        color: Color(0xFF1D8D2F))
                                    : Icon(Icons.check_box_outline_blank,
                                        color: Color(0xFF1D8D2F)),
                              ),
                              // InkWell(
                              //   onTap: ,
                              //   child: Icon(Icons.check_box_outline_blank,
                              //       color: Color(0xFF1D8D2F)),
                              // )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Trial Period",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: const Color(0xFFD1D1D1), width: 1)),
                            child: TextFormField(
                              controller: trialController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'Trial Period',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontWeight: FontWeight.w400,
                                ),
                                // fillColor: ,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  'Send Push Notifications',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.check_box_outline_blank,
                                  color: Color(0xFF1D8D2F))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Group Rules",
                              style: newGroupContentTextStyle.copyWith(),
                            ),
                          ),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: const Color(0xFFD1D1D1), width: 1)),
                            child: TextFormField(
                              controller: groupRulesController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'Group Rules',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                  fontWeight: FontWeight.w400,
                                ),
                                // fillColor: ,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFFD1D1D1)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: RawMaterialButton(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          fillColor: const Color(0xff1D8D2F),
                          onPressed: () async {
                            var data = await GroupCreateRepository()
                                .postGroup('Group2', 'Good group', false, 15);
                            var res = GroupBody.fromJson(jsonDecode(data!));
                            print(res);
                            if (res.success == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GroupSection()),
                              );
                            }
                            // await GroupCreateRepository().postGroup(
                            //     userTypeController.text,
                            //     aboutGroupController.text,
                            //     isPaid,
                            //     int.parse(trialController.text));
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Publish",
                                  style: homescreenContainerTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File([], "a");
        });
      } else {
        print('No Image');
      }
    } else {
      print('No');
    }
  }
}
