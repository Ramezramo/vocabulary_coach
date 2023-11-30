import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
Future<void> dataBaseUpdater() async {
  print("in database updater");
  FirebaseFirestore db = FirebaseFirestore.instance;
  var userDocRef = db.collection('users').doc('teKESef7NCcCZwGgZzjSlfVsNgG2');
  // added
  String pageNAme = "page_40";
  Map theData = {
    "1cpxne1lcwnv": {
      "arabic_phrase": "كاريكاتير كما أرادوا في ساعتين",
      "english_phrase": "comics as they wanted in two hours",
      "user_english_phrase": "",
      "count": 1
    },
    "avnd2zb54oss": {
      "arabic_phrase": "لقد كانت صفقة بالنسبة لهم منذ أ\nتبلغ تكلفة كل قصة كوميدية 10 سنتات، ويمكنهم قراءة خمسة أو ستة سنتات في ساعتين",
      "english_phrase": "It was a bargain for them since a\ncomic cost 10 cents each, and they could read five or six in two hours",
      "user_english_phrase": "",
      "count": 2
    },
    "piwetatpucsi": {
      "arabic_phrase": "ستقوم أخت مايك بفحص الأطفال أثناء مغادرتهم للتأكد من أنهم\nلم نستعير أي كتب هزلية",
      "english_phrase": "Mike’s sister would check the kids as they left to make sure they\nweren’t borrowing any comic books",
      "user_english_phrase": "",
      "count": 3
    },
    "7ir6t2s8iwbe": {
      "arabic_phrase": "كما أنها احتفظت بالكتب وقطع الأشجار\nفي عدد الأطفال الذين يظهرون كل يوم، ومن هم، وأي منهم\nالتعليقات التي قد تكون لديهم",
      "english_phrase": "She also kept the books, logging\nin how many kids showed up each day, who they were, and any\ncomments they might have",
      "user_english_phrase": "",
      "count": 4
    },
    "x67d8do6cl30": {
      "arabic_phrase": "لقد كان متوسط ​​أجري أنا ومايك 9",
      "english_phrase": "Mike and I averaged \$9",
      "user_english_phrase": "",
      "count": 5
    },
    "n766f7fugxcn": {
      "arabic_phrase": "50 دولارًا في الأسبوع\nعلى مدى ثلاثة أشهر",
      "english_phrase": "50 per week\nover a three-month period",
      "user_english_phrase": "",
      "count": 6
    },
    "lih93yprkpo6": {
      "arabic_phrase": "كنا ندفع لأخته دولارًا واحدًا في الأسبوع و\nسمحت لها بقراءة القصص المصورة مجانًا، وهو ما نادرًا ما فعلته منذ ذلك الحين\nكان يدرس دائما",
      "english_phrase": "We paid his sister one dollar a week and\nallowed her to read the comics for free, which she rarely did since she\nwas always studying",
      "user_english_phrase": "",
      "count": 7
    },
    "sh1p266qu3rv": {
      "arabic_phrase": "حافظت أنا ومايك على اتفاقيتنا من خلال العمل في المتجر كل يوم\nالسبت وجمع كل الكتب المصورة من المتاجر المختلفة",
      "english_phrase": "Mike and I kept our agreement by working in the store every\nSaturday and collecting all the comic books from the different stores",
      "user_english_phrase": "",
      "count": 8
    },
    "o167r0qgl9ms": {
      "arabic_phrase": "لقد حافظنا على اتفاقنا مع الموزع بعدم بيع أي كتاب فكاهي\nكتب",
      "english_phrase": "We kept our agreement to the distributor by not selling any comic\nbooks",
      "user_english_phrase": "",
      "count": 9
    },
    "wnghyxblv2g3": {
      "arabic_phrase": "لقد أحرقناها عندما أصبحت ممزقة للغاية",
      "english_phrase": "We burned them once they got too tattered",
      "user_english_phrase": "",
      "count": 10
    },
    "dw0t6aray6pm": {
      "arabic_phrase": "لقد حاولنا الفتح\nمكتب فرعي، ولكن لم نتمكن أبدًا من العثور على شخص جدير بالثقة تمامًا\nومخصصة كأخت مايك",
      "english_phrase": "We tried opening\na branch office, but we could never quite find someone as trustworthy\nand dedicated as Mike’s sister",
      "user_english_phrase": "",
      "count": 11
    },
    "wuzg6ybs8tvs": {
      "arabic_phrase": "في سن مبكرة، اكتشفنا مدى صعوبة ذلك\nكان العثور على موظفين جيدين",
      "english_phrase": "At an early age, we found out how hard\nit was to find good staff",
      "user_english_phrase": "",
      "count": 12
    },
    "yg897yxdatvj": {
      "arabic_phrase": "بعد ثلاثة أشهر من افتتاح المكتبة لأول مرة، اندلع شجار\nالغرفة",
      "english_phrase": "Three months after the library first opened, a fight broke out in\nthe room",
      "user_english_phrase": "",
      "count": 13
    },
    "nwu1ph4bbeeo": {
      "arabic_phrase": "قام بعض المتنمرين من حي آخر بدفعهم\nفي الطريق، واقترح والد مايك أن نغلق العمل",
      "english_phrase": "Some bullies from another neighborhood pushed their\nway in, and Mike’s dad suggested we shut down the business",
      "user_english_phrase": "",
      "count": 14
    },
    "b394y7wqdowi": {
      "arabic_phrase": "لذا\nتم إغلاق أعمالنا في مجال الكتب المصورة، وتوقفنا عن العمل\nأيام السبت في المتجر",
      "english_phrase": "So\nour comic-book business shut down, and we stopped working on\nSaturdays at the convenience store",
      "user_english_phrase": "",
      "count": 15
    },
    "qn56ryq0oqx0": {
      "arabic_phrase": "لكن الأب الغني كان متحمسًا لأنه\nكان لديه أشياء جديدة يريد أن يعلمنا إياها",
      "english_phrase": "But rich dad was excited because\nhe had new things he wanted to teach us",
      "user_english_phrase": "",
      "count": 16
    },
    "a7xw34h2onu3": {
      "arabic_phrase": "لقد كان سعيدًا لأننا\nلقد تعلمنا درسنا الأول جيدًا: لقد تعلمنا كيف نجعل المال يعمل\nلنا",
      "english_phrase": "He was happy because we\nhad learned our first lesson so well: We learned to make money work\nfor us",
      "user_english_phrase": "",
      "count": 17
    },
    "42mqb79b5ik8": {
      "arabic_phrase": "وبسبب عدم حصولنا على أجر مقابل عملنا في المتجر، اضطررنا لذلك\nلاستخدام مخيلتنا لتحديد فرصة لكسب المال",
      "english_phrase": "By not getting paid for our work at the store, we were forced\nto use our imaginations to identify an opportunity to make money",
      "user_english_phrase": "",
      "count": 18
    },
    "hagchdv5tfb8": {
      "arabic_phrase": "عندما بدأنا عملنا الخاص، مكتبة الكتب المصورة، وصلنا إلى هناك\nالتحكم في مواردنا المالية، وعدم الاعتماد على صاحب العمل",
      "english_phrase": "By starting our own business, the comic-book library, we were in\ncontrol of our own finances, not dependent on an employer",
      "user_english_phrase": "",
      "count": 19
    },
    "mqj9cfz2wemu": {
      "arabic_phrase": "الأفضل\nالجزء هو أن أعمالنا كانت تولد المال لنا، حتى عندما كنا\nلم تكن هناك جسديا",
      "english_phrase": "The best\npart was that our business generated money for us, even when we\nweren’t physically there",
      "user_english_phrase": "",
      "count": 20
    },
    "wljtwnbhncsg": {
      "arabic_phrase": "عملت أموالنا بالنسبة لنا",
      "english_phrase": "Our money worked for us",
      "user_english_phrase": "",
      "count": 21
    },
    "j766mltbaren": {
      "arabic_phrase": "بدلاً من أن يدفع لنا المال، أعطانا أبي الغني أكثر من ذلك بكثير",
      "english_phrase": "Instead of paying us money, rich dad had given us so much more",
      "user_english_phrase": "",
      "count": 22
    }
  };

  // Get the current data
  try {
    DocumentSnapshot userDoc = await userDocRef.get();
    Map<String, dynamic>? theDataBaseAsJson = userDoc.data() as Map<String, dynamic>?;

    // Check if 'books' field exists
    if (theDataBaseAsJson != null && theDataBaseAsJson.containsKey('books')) {
      // If 'books' field exists, update it by adding a new page
      Map<String, dynamic> booksData = theDataBaseAsJson['books'];
      booksData["poordadrichdad"] ??= {};
      booksData["poordadrichdad"][pageNAme] = theData;

      // Atomically update the 'books' field with the modified data
      await userDocRef.update({
        "books": booksData,
      });
    } else {
      // If 'books' field doesn't exist, create it with the new page
      await userDocRef.update({
        "books": {
          "poordadrichdad": {
            "page23": theData,
          },
        },
      });
    }

    print("Supposed to be updated");
    print(pageNAme);
  } catch (e) {
    print("Error updating document: $e");
  }
}



void updateTheUserTranslation(phraseRandomName,bookName, pageName, theTranslation) async {
  print("in data base updater");
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Replace 'teKESef7NCcCZwGgZzjSlfVsNgG2' with the actual user ID
  String userId = 'teKESef7NCcCZwGgZzjSlfVsNgG2';

  // Reference to the specific document
  DocumentReference userRef = db.collection('users').doc(userId);

  // Update the specific field
  try {
    await userRef.update({
      'books.$bookName.$pageName.$phraseRandomName.user_english_phrase': theTranslation,
    });

    print('User translation updated successfully.');
  } catch (e) {
    print('Error updating user translation: $e');
  }
}
