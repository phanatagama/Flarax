import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget contactOwner(context) => ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Phone Number'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.whatsapp),
                      title: const Text('Whats App'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.telegram),
                      title: const Text('Telegram'),
                      onTap: () {},
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Contact Seller'),
        );