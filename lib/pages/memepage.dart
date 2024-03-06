import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion/motion.dart';
import 'package:testrun/api/jokeapi.dart';
import 'package:testrun/api/profileapi.dart';
import 'package:testrun/model/jokemodel.dart';
import 'package:testrun/pages/profilepage.dart';

// I make this stateful widget to Conumer widget because
//in this screen we are use provider state Manegment

// final memeProvider = FutureProvider<List<Joke>>((ref) async {
//   return await getjokeapi();
// });

class MemePage extends ConsumerStatefulWidget {
  const MemePage({super.key});

  @override
  ConsumerState<MemePage> createState() => _MemePageState();
}

class _MemePageState extends ConsumerState<MemePage> {
  List<Joke> data = [];
  StateProvider loaderProvider = StateProvider((ref) => true);

  callApi() async {
    fetchuserdata(ref: ref);
    data = await getjokeapi()
        .whenComplete(() => ref.watch(loaderProvider.notifier).state = false);
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(loaderProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Take one Row widget
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Container widget for image profile
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/profile.jpg")),
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(width: 5),
                // RichText widget for text "Enjoy Your Meme" with style
                RichText(
                  text: TextSpan(
                      text: "Enjoy Your",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 1),
                      children: [
                        TextSpan(
                          text: " Meme",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1),
                        )
                      ]),
                ),
              ],
            ),
            loader
                ? const SizedBox.shrink()
                : GridView.builder(
                    itemCount: data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      // call our small card
                      return memsmallcard(
                          context: context,
                          image: data[index].url.toString(),
                          heading: data[index].name.toString());
                    }),
          ],
        ),
      ),
    );
  }
}

// Small card is the custom widget for image
Widget memsmallcard(
    {required BuildContext context,
    required String image,
    required String heading}) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) =>
              memepopup(image: image, heading: heading, context: context));
    },
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}

//Popup code
Widget memepopup(
    {required String image,
    required String heading,
    required BuildContext context}) {
  // Dilog is used to create popup window
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    // child is property of dialog widget
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 1),
          ),
          const SizedBox(height: 20),
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(image)),
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Try Making Sharing Feature by urself'),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.share,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Try Making Save Feature by urself'),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.save_alt,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
