import 'package:apriori/importfile.dart';
import 'package:flutter/material.dart';

class DataTransaksiPage extends StatefulWidget {
  final List<List<dynamic>> data;

  const DataTransaksiPage({Key? key, required this.data}) : super(key: key);

  @override
  _DataTransaksiPageState createState() => _DataTransaksiPageState();
}

class _DataTransaksiPageState extends State<DataTransaksiPage> {
  List<List<dynamic>> savedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22411F),
      appBar: AppBar(
        title: const Text('Data Transaksi'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.data.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Data tidak ditemukan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF7AA748),
                      ),
                      dataRowColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.selected)
                            ? Colors.grey.shade200 // Background color when row is selected
                            : Colors.white, // Default background color for rows
                      ),
                      headingTextStyle: const TextStyle(
                        color: Colors.white, // Header text color
                        fontWeight: FontWeight.bold,
                      ),
                      dataTextStyle: const TextStyle(
                        color: Colors.black, // Data cell text color
                      ),
                      columnSpacing: 48.0,
                      headingRowHeight: 48.0,
                      columns: _buildColumns(),
                      rows: _buildRows(),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 32.0), // Add vertical padding to the button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _saveData();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF7AA748),
                      ),
                    ),
                    child: const Text('Simpan Data'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImportFile(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF7AA748),
                      ),
                    ),
                    child: const Text('Upload Data'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    List<dynamic> headers = widget.data.first;
    return headers.map((header) => DataColumn(label: Text('$header'))).toList();
  }

  List<DataRow> _buildRows() {
    List<List<dynamic>> rows = widget.data.skip(1).toList();
    return rows.map((row) {
      assert(row.length == widget.data.first.length);
      return DataRow(
        cells: row.map((cell) => DataCell(Text('$cell'))).toList(),
      );
    }).toList();
  }

  void _saveData() {
    setState(() {
      savedData = List.from(widget.data); // Create a new copy of the data
    });
    // You can now use the 'savedData' list for further processing or saving.
    print('Data has been saved: $savedData');
  }
}
