import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learn/author/controller/author_controller.dart';
import 'package:flutter_riverpod_learn/common/models/book_model.dart';
import 'package:flutter_riverpod_learn/common/styles/constant.dart';
import 'package:flutter_riverpod_learn/common/widgets/custom_appbar.dart';

class AuthorHomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/author_home_screen';

  const AuthorHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AuthorHomeScreenState();
}

class AuthorHomeScreenState extends ConsumerState<AuthorHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(authorControllerProvider.notifier).getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar("HOME"),
      body: _body(),
    );
  }

  Widget _body() {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _menuBar(),
              _searchBar(),
              _listProjectView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 15.0),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menuBarItem(Icons.assignment, "Report", () {}),
            _menuBarItem(Icons.question_mark, "???", () {}),
          ],
        ),
      ),
    );
  }

  Widget _menuBarItem(IconData icon, String label, void Function()? onPressed) {
    return SizedBox(
      height: 85.0,
      width: 85.0,
      child: Card(
        elevation: 5.0,
        child: Material(
          child: InkWell(
            onTap: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  size: 35.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            debugPrint("onChanged :");
            ref
                .read(searchTextProvider.notifier)
                .state = value;
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                debugPrint("onPressed :");
                ref
                    .read(searchTextProvider.notifier)
                    .state =
                    _searchController.text;
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  List<String> genreFilter = [
    "Template",
    "Biography",
    "Romance",
    "Slice Of Life",
    "Children Book",
    "Adventure",
    "Casual"
  ];

  Widget _showFilterMenu() {
    return Container();
  }

  Widget _listProjectView() {
    final books = ref.watch(futureFilteredList);
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height / 1.5,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        elevation: 5.0,
        child: books.when(
          data: (data) {
            debugPrint("listView : $data");
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: data.isNotEmpty ? data.length : 1,
                itemBuilder: (BuildContext context, int index) {
                  if (data.isEmpty) {
                    return const Center(
                      child: Text(
                        "Data not found!",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }
                  return _projectViewItem(data[index]);
                });
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(
                '${error.toString()} occurred',
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _projectViewItem(BookModel bookModel) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
      height: 150.0,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reportItemContent(bookModel.title, false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget reportItemContent(String content, bool isDesc) {
    return Flexible(
      flex: isDesc ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.only(top: 2.5, bottom: 2.5),
        child: Text(
          content,
          style: kContentReportItem,
          softWrap: true,
          maxLines: isDesc ? 3 : 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget reportStatus(int status) {
    IconData? statusIcon;
    Color? iconColor;
    switch (status) {
      case 0:
        statusIcon = Icons.timelapse;
        iconColor = Colors.yellow;
        break;
      case 1:
        statusIcon = Icons.done;
        iconColor = Colors.green;
        break;
      case 2:
        statusIcon = Icons.cancel_outlined;
        iconColor = Colors.red;
        break;
      default:
        statusIcon = Icons.timelapse;
        iconColor = Colors.yellow;
        break;
    }
    return Center(
        child: Icon(
          statusIcon,
          size: 20.0,
          color: iconColor,
        ));
  }
}
