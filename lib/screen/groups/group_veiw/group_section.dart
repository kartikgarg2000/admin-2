import 'package:agrishot_admin/screen/groups/group_create/cubit/group_create_cubit.dart';
import 'package:agrishot_admin/screen/groups/group_create/group_create.dart';
import 'package:agrishot_admin/screen/groups/group_veiw/cubit/group_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Theme/text_style.dart';

class GroupSection extends StatefulWidget {
  GroupSection({Key? key}) : super(key: key);

  @override
  State<GroupSection> createState() => _GroupSectionState();
}

class _GroupSectionState extends State<GroupSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<GroupCubit>();
      cubit.fetchGroups();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDFE0EB), width: 2),
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Manage Group type',
                      style: homeScreenTextStyle.copyWith(
                          fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: const Icon(
                        CupertinoIcons.sort_up,
                        color: Color(0xffC5C7CD),
                      ),
                      title: Text(
                        'Sort',
                        style: homescreenContainerTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff4B506D),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: const Icon(
                        Icons.filter_alt_sharp,
                        color: Color(0xffC5C7CD),
                      ),
                      title: Text(
                        'Filter',
                        style: homescreenContainerTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff4B506D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
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
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Create Group Type ",
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: RawMaterialButton(
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      fillColor: const Color(0xff1D8D2F),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupCreate()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Create Group Subtype ",
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
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Group Avatar',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 1,
                    child: Text('Group Name',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 1,
                    child: Text('Moderator',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 1,
                    child: Text('Created Date',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Members',
                      style: homescreenContainerTextStyle,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      'Paid Group',
                      style: homescreenContainerTextStyle,
                    )),
                Expanded(
                    // flex: 1,
                    child: SizedBox()),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            BlocBuilder<GroupCubit, GroupState>(builder: (context, state) {
              if (state is GroupInitial || state is GroupLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GroupResponse) {
                final groupData = state.groupData;
                return Expanded(
                  child: ListView.builder(
                      itemCount: groupData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100, // width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Text(groupData[index].name)
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(groupData[index].name,
                                          style: groupdataTextStyle,
                                          textAlign: TextAlign.center)),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                          groupData[index]
                                              .moderatorId
                                              .toString(),
                                          style: groupdataTextStyle,
                                          textAlign: TextAlign.center)),
                                  Expanded(
                                      flex: 1,
                                      child: Text(groupData[index].createdBy,
                                          style: groupdataTextStyle,
                                          textAlign: TextAlign.center)),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        groupData[index].trialPeriod.toString(),
                                        style: groupdataTextStyle,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: groupData[index].isPaid
                                                ? Colors.green
                                                : Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        child: Center(
                                          child: Text(
                                            groupData[index].isPaid
                                                ? "Yes"
                                                : "No",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.more_vert,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 111, 111, 111),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              )
                            ],
                          ),
                        );
                      }),
                );
              } else if (state is GroupError) {
                return Text(state.message);
              }
              return Text(state.toString());
            })
          ],
        ),
      ),
    );
  }
}
