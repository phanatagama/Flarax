import 'package:flarax/app/core/utils/launcher.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget contactOwner(context, userChat) => Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('Phone Number'),
                        onTap: () => makePhoneCall(userChat.value.phoneNumber),
                      ),
                      ListTile(
                          leading: const FaIcon(FontAwesomeIcons.whatsapp),
                          title: const Text('Whats App'),
                          onTap: () => launchInBrowser(
                                'https://api.whatsapp.com/send?phone=${userChat.value.phoneNumber}',
                              )),
                      ListTile(
                        leading: const FaIcon(FontAwesomeIcons.envelope),
                        title: const Text('Email'),
                        onTap: () => launchInBrowser(
                          'mailto:${userChat.value.email}',
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              Const.CONTACT,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.CHAT, arguments: [
                      userChat.value.uid,
                      userChat.value.photoUrl,
                      userChat.value.fullname
                    ]),
                child: Text(
                  Const.CHAT,
                  style: Theme.of(Get.context!).textTheme.button!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )))
      ],
    );
