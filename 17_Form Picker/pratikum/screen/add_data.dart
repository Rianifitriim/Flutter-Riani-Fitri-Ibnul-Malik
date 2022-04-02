import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../model/data_form.dart';
import 'package:uuid/uuid.dart';

class AddData extends StatefulWidget {
  final Function(DataForm) onCreate;
  const AddData({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  DateTime? _dueDate;
  final currentDate = DateTime.now();
  Color _currentColor = Colors.amber;
  final _taskNameController = TextEditingController();
  String _taskName = '';
  String? lokasiFile;

  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        _taskName = _taskNameController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _taskNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cover',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Pilih File'),
                      onPressed: () {
                        _pickFile();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Tanggal',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildDatePicker(context),
                  const SizedBox(
                    height: 20,
                  ),
                  buildColorPicker(context),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Caption',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _taskNameController,
                    minLines: 5,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Masukkan Keterangan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(05.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final tambahData = DataForm(
                          id: const Uuid().v1(),
                          file: lokasiFile,
                          createdAt: _dueDate,
                          caption: _taskNameController.text,
                          color: _currentColor,
                        );
                        widget.onCreate(tambahData);
                      },
                      child: const Text(
                        'SUBMIT',
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
        onPressed: () async {
          final selectDate = await showDatePicker(
            context: context,
            initialDate: currentDate,
            firstDate: DateTime(1990),
            lastDate: DateTime(currentDate.year + 5),
          );
          setState(() {
            if (selectDate != null) {
              _dueDate = selectDate;
            }
          });
        },
        child: Text(
          _dueDate == null
              ? 'dd/mm/yyyy'
              : DateFormat('dd-MM-yyyy').format(_dueDate!),
        ),
      ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      lokasiFile = file.path;
    });
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_currentColor),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: BlockPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              _currentColor = color;
                            });
                          },
                        ),
                        title: const Text(
                          'Pick Your Color',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('save'),
                          )
                        ],
                      );
                    });
              },
              child: const Text(
                'Pilih Warna',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
