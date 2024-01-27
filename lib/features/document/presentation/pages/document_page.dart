import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gosign/features/document/presentation/bloc/document_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  List documentlist = [];

  @override
  void initState() {
    super.initState();
    context.read<DocumentBloc>().add(const DocumentEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.upload_file_outlined),
      ),
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(
            top: 25.0,
          ),
          width: 125.0,
          height: 50.0,
          child: const Text(
            "Daftar Dokumen",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.list_alt_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.swap_vert_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox(
                child: Text('ok'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (message) {
              return Center(
                child: Text(message),
              );
            },
            success: (datum) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        width: 370.0,
                        color: Colors.yellow[100],
                        child: const TextScroll(
                          'This is the sample text for Flutter TextScroll widget with faded border.',
                          intervalSpaces: 10,
                          velocity: Velocity(pixelsPerSecond: Offset(30, 0)),
                          fadedBorder: true,
                          fadedBorderWidth: 0.1,
                          fadeBorderVisibility: FadeBorderVisibility.auto,
                          fadeBorderSide: FadeBorderSide.both,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          onPressed: () {},
                          label: Text('Aplikasi'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          onPressed: () {},
                          label: Text('Jenis Dokumen'),
                        ),
                      ]),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: datum.length, // Jumlah item dalam list
                          itemBuilder: (context, index) {
                            final documentData = datum[index];
                            return Container(
                              width: 250.0,
                              height: 150.0,
                              margin: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              color: Colors.grey.withOpacity(0.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(documentData.title),
                                  Text(documentData.documentType),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
