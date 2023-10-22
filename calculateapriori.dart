import 'package:flutter/material.dart';

class CountAprioriPage extends StatelessWidget {
  final List<List<dynamic>> data; // Perbarui tipe data menjadi List<List<dynamic>>

  CountAprioriPage({required this.data}); // Perbarui konstruktor dengan parameter yang sesuai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22411F),
      appBar: AppBar(
        title: const Text('Perhitungan Apriori'),
        backgroundColor: const Color(0xFF22411F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Hasil perhitungan 1 itemset",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) =>
                const Color.fromARGB(255, 219, 218, 218)),
                dataRowColor: MaterialStateColor.resolveWith((states) =>
                Colors.white),
                columnSpacing: 16.0,
                headingRowHeight: 48.0,
                columns: _buildTableColumns(),
                rows: _buildTableRows(),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi yang dilakukan saat tombol minimum support ditekan
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF7AA748)),
                  ),
                  child: const Text('Minimum Support'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _buildTableColumns() {
    return [
      const DataColumn(
        label: Text('No'),
      ),
      const DataColumn(
        label: Text('Fitur 1'),
      ),
      const DataColumn(
        label: Text('Fitur 2'),
      ),
      const DataColumn(
        label: Text('Fitur 3'),
      ),
      const DataColumn(
        label: Text('Action'),
      ),
    ];
  }

  List<DataRow> _buildTableRows() {
    return data.map((rowData) {
      return DataRow(
        cells: [
          DataCell(
            Text(rowData[0]?.toString() ?? ''), // Sesuaikan dengan indeks data yang sesuai
          ),
          DataCell(
            Text(rowData[1]?.toString() ?? ''), // Sesuaikan dengan indeks data yang sesuai
          ),
          DataCell(
            Text(rowData[2]?.toString() ?? ''), // Sesuaikan dengan indeks data yang sesuai
          ),
          DataCell(
            Text(rowData[3]?.toString() ?? ''), // Sesuaikan dengan indeks data yang sesuai
          ),
          DataCell(
            Text(rowData[4]?.toString() ?? ''), // Sesuaikan dengan indeks data yang sesuai
          ),
        ],
      );
    }).toList();
  }
}
