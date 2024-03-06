import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/api/profileapi.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userdata = ref.watch(userdataProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyPage()))
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' Company Details',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_3_sharp,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userdata.name.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade500,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userdata.phone.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade500,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      userdata.email.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade500,
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
