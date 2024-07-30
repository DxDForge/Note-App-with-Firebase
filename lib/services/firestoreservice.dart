import 'package:cloud_firestore/cloud_firestore.dart';


class FIreStoreService{
  //get collection of notes
   
final CollectionReference notes =
 FirebaseFirestore.instance.collection('notes');

  //C R E A T E 
Future<void> addNote(String note) async {
  try {
    await notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  } catch (e) {
    print("Error adding note: $e");
  }
}


  // R E A D
    Stream<QuerySnapshot> getNotestream (){
      final notestream = 
      notes.orderBy('timestamp',descending: true).snapshots();
      return notestream;
    }

  // U P D A T E
  Future<void> updateNotes(String docID,String newNote)async{
    return notes.doc(docID).update({
      'note' :newNote,
      'timestamp':Timestamp.now(),
    });
  }

  // D E L E T E
  Future<void> deleteNote(String docID)async{
    return notes.doc(docID).delete();
  }
}