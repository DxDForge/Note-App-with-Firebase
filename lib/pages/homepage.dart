import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/services/firestoreservice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //t e x t Editing controller
  final TextEditingController textController = TextEditingController();

  //call the database
  final FIreStoreService fIreStoreService = FIreStoreService();

  //o p e n dailog

  void openAddNote({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                //add a new note
                if (docID==null) {
                   fIreStoreService.addNote(textController.text);
                }
                //update note
                else{
                 
                  fIreStoreService.updateNotes(docID, textController.text);
                }
                
                Navigator.pop(context);

                //clear the textfield
                textController.clear();
              },
              child: const Text('Add'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openAddNote,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note App',style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: StreamBuilder<QuerySnapshot>(
        // Listening to the Firestore stream
        stream: fIreStoreService.getNotestream(),
        builder: (context, snapshot) {
          // Check if the snapshot has data
          if (snapshot.hasData) {
            // Extract the list of documents from the snapshot
            List noteList = snapshot.data!.docs;

            // Create a scrollable list of items
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (BuildContext context, int index) {
                // Get the document at the current index
                DocumentSnapshot document = noteList[index];
                // Get the document ID
                String docID = document.id;

                // Get the data from the document and cast it to a map
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                // Extract the note text from the data
                String notetext = data['note'];

                // Display the note text in a ListTile widget
                return Container(
                  margin: EdgeInsets.only(left: 25,right: 25,bottom: 7),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                    children: [
                        //edit button
                        IconButton(
                          onPressed:()=> openAddNote(docID: docID), 
                          icon: const Icon(Icons.edit)),
                      //delete button
                      IconButton(onPressed: (){fIreStoreService.deleteNote(docID);}, 
                      icon: const Icon(Icons.delete))
                    ],
                      
                    ),
                    title: Text(notetext),
                  ),
                );
              },
            );
          } else {
            // If no data, display a message
            return Text('No Data...');
          }
        },
      ),
    );
  }
}
