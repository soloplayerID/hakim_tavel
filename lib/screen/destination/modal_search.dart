part of '../screen.dart';

class ModalSearch extends StatefulWidget {
  final List destinationResponse;
  final bool isCalender;
  const ModalSearch(
      {super.key, required this.destinationResponse, required this.isCalender});

  @override
  State<ModalSearch> createState() => _ModalSearchState();
}

class _ModalSearchState extends State<ModalSearch> {
  // List searchResult = [];
  DateTime today = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
  }

  // void searchFromFirebase(String query) async {
  //   final result = (await FirebaseFirestore.instance
  //           .collection('province')
  //           .where('name', whereIn: [query]).get())
  //       .docs;

  //   setState(() {
  //     searchResult = result.map((e) => e.data()).toList();
  //     print('=== $searchResult');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: widget.isCalender == true
              ? Container(
                  height: 290,
                  decoration: BoxDecoration(
                    color: kLighterWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TableCalendar(
                    calendarStyle: const CalendarStyle(
                        canMarkersOverflow: true,
                        holidayTextStyle: TextStyle(color: Colors.orange),
                        todayTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white)),
                    calendarFormat: CalendarFormat.month,
                    firstDay: DateTime.utc(2022, 12, 1),
                    lastDay: DateTime.utc(2050, 3, 14),
                    focusedDay: today,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, focusedDay)) {
                        setState(() {
                          today = focusedDay;
                          Navigator.pop(
                              context, today.toString().split(" ")[0]);
                          // _addDailyReportModel.tanggalDaily.text = today.toString().split(" ")[0];
                          // _addLemburModel.tanggallembur.text = today.toString().split(" ")[0];
                        });
                      }
                    },
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    shouldFillViewport: true,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // implement the search field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              suffixIcon: const Icon(Icons.close),
                              hintText: 'Tulis Nama Tempat',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // This button is used to close the search modal
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'))
                      ],
                    ),

                    // display other things like search history, suggestions, search results, etc.
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.destinationResponse.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              onTap: () {
                                print(
                                    widget.destinationResponse[index]['name']);
                                Navigator.pop(context, index);
                              },
                              leading: SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  "assets/dummy.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                  widget.destinationResponse[index]['name']),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
