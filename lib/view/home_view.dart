import 'package:book/View/scan_book_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final viewModel = ref.refresh(scanBookViewModelProvider.notifier);
    // final mainViewModel = ref.watch(mainViewModelProvider.notifier);
    // ref.listen(scanBookViewModelProvider, (_, ScanBookState next) async {
    // });
    return Scaffold(
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: Colors.blue,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.border_color_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScanBook()),
                  );
                },
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Card(
                      color: Colors.lightGreenAccent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.barcode_reader,
                              size: 50,
                            ),
                            Text(
                              'バーコードを\nスキャン',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
