import 'package:apriori/calculateapriori.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class ImportFile extends StatefulWidget {
  const ImportFile({Key? key}) : super(key: key);

  @override
  _ImportFileState createState() => _ImportFileState();
}

class _ImportFileState extends State<ImportFile> {
  String? _selectedFileName;
  final List<List<dynamic>> _excelData = [];

  Future<void> _readFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'csv'],
      withData: true, // Request to load file contents into memory
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        _selectedFileName = file.name;
      });

      if (file.bytes != null) {
        var bytes = file.bytes!;
        var excel = Excel.decodeBytes(bytes);

        _excelData.clear(); // Bersihkan data sebelumnya (jika ada)

        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            final cellValues = row.map((cell) => cell?.value).toList();
            _excelData.add(cellValues);
          }
        }
      }
    } else {
      setState(() {
        _selectedFileName = null;
        _excelData.clear();
      });
    }
  }

  void clearFile() {
    setState(() {
      _selectedFileName = null;
      _excelData.clear();
    });
  }

  Future<void> _importDataToDataTransaction(BuildContext context) async {
    if (_excelData.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountAprioriPage(data: _excelData), // Kirim data ke CountAprioriPage
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Import Error'),
          content: const Text('Tidak ada data yang ditemukan dalam file excel.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Getter untuk mengakses data _excelData
  List<List<dynamic>> get excelData => _excelData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Excel'),
        backgroundColor: const Color(0xFF22411F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF7AA748),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await _readFile();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              const Color(0xFF22411F)),
                        ),
                        child: const Text('Pilih File'),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          _selectedFileName ?? "Tidak Ada File Dipilih",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      if (_selectedFileName != null)
                        IconButton(
                          onPressed: clearFile,
                          icon: const Icon(Icons.clear),
                          color: Colors.red,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  await _importDataToDataTransaction(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF22411F)),
                ),
                child: const Text('Import'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
