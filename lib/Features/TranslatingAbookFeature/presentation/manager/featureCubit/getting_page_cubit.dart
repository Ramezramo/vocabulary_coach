import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'getting_page_state.dart';

class GettingPageCubit extends Cubit<GettingPageState> {
  GettingPageCubit() : super(GettingPageInitial());

  List<String> getDateFromDb() {
    String text =
        """""الوظيفية أكثر أهمية فى بعض أحيان من الوظيفة ذاتها ، فكان يردد أن : قد عملت باجتهاد فى الحكومة ، وأستحق هذه المنافع
  أما الأب الآخر <spl>، فآمن بالاعتماد المالى الذاتى الكامل ، " المستحقات " وكيف أوجدت أناساً معوزين وذوى مركز مالي <spl>
    وكان
  يشدد على تحقيق الجدارة المالية كان أحدهما يكافح ليدخر قلة من الدولارات ، فيما كان الآخر يبنى
  الاستثمارات بسهولة .<spl>
  علمنی أحدهما كيف أكتب التماسا مؤثرا يخولني الحصول على وظيفة ، بينما علمني الآخر الصياغة الحسنة لخطط المال والأعمال لأخلق وظائف
  للآخرين <spl>
  وكونى محصلة لفكرى أبوين مؤثرين ، أتاح لى ذلك ملاحظة أثر توجهين فكريين مختلفين على حياة صاحبيهما . فعلمت أن الناس حقا يشكلون حياتهم
  من خلال أفكارهم <spl>
  فعلى سبيل المثال ، كان أبى الفقير يقول دوما : " لن أحقق الثراء أبدا وقد أضحت تلك النبوءة حقيقة ، أما والدى الثرى فعلى الطرف الآخر<spl>
   ، كان يشير لنفسه على الدوام بكونه ثرياً. كان يقول أشياء  مثل : " إنني رجل ثرى ، والأثرياء لا يفعلون هذا " ، وحتى بعدما تعرض لأزمة مالية بكل ما
  تحمله الكلمة من معنى <spl>، استمر يشير لنفسه كرجل ثرى. وكان يعلق على أزمته قائلا : " هناك فارق بين كون المرء معوزا ، وبين تعرضه لأزمة مالية فالأزمات وقتية ، أما الفقر فأبدى <spl>
  أما أبي الفقير ، فكان يقول : " لا يتملكني الاهتمام بالمال أو " إن المال ليس شيئا مهماً "<spl> ، بينما كان أبى الثرى يقول : " المال قوة " وقد لا نستطيع قياس قوة أفكارنا أبدا أو تقدير قوتها ، لكنه أضحى جليا لى كطفل<spl>
   أن أكون واعيا بأفكارى وبالكيفية التي أرمز بها  لنفسي فإننا نجذب لأنفسنا ما نفكر فيه<spl> ، فلقد لاحظت أن والدى الفقير كان فقيرا ليس بسبب قدر المال الذى كان يجنيه - والذى كان كبيرا - <spl>
  ولكن كان ذلك بسبب أفكاره وسلوكياته . وكفتى صغير عايش أبوين <spl>، أضحيت واعيا تمام الوعى بالحذر من أى الأفكار أعتنقها لنفسي ، وأى الأبوين أنصت إليه ، هل أنصت للثرى منهما أم للفقير ؟ <spl>
  وعلى الرغم من أن كلا الرجلين بالغ مبالغة عظيمة في احترام التعليم والتعلم<spl>
   ، إلا أنهما اختلفا فيما ارتأياه جديرا بالتعلم ، فقد أرادني أحدهما أن أدرس بجد وأنال درجات وأحصل على وظيفة لأجنى المال <spl>.  لقد أراد من الدراسة أن أصير محترفا، أى أن أصير محاميا أو محاسبا أو أن أدرس لأحصل<spl>
   على الماجيستير ، أما الآخر ، فشجعني على الدراسة لأصير ثريا ،  ولأفهم طبيعة المال ولأتعلم كيف أضعه موضع العمل لصالحي .<spl> " إنني لا أعمل من أجل المال ،  بل المال هو ما يعمل لأجلى " تلك كلمات كان يرددها على<spl>
   مسامعي مرارا وتكرارا وفى سن التاسعة ، قررت أن أنصت وأن أتعلم من والدي الثرى ما يقوله عن المال ، وفي سعيى هذا ،<spl> اخترت ألا أنصت لوالدى الفقير ، وإن كان هو الحاصل على كل الدرجات الجامعية  .<spl>
  """;

    List<String> phrasesSplited = text.split("<spl>");
    // print(phrasesSplited.length);
    emit(SuccessPage(phrasesSplited));
    return phrasesSplited;
  }
}
Future<void> readField() async {
  // Reference to the 'books' collection
  CollectionReference booksCollection = FirebaseFirestore.instance.collection('books');

  // Reference to the specific book document (replace '8I0vkfPjS7Bxiw36ImBN' with your actual document ID)
  DocumentReference bookDocument = booksCollection.doc('8I0vkfPjS7Bxiw36ImBN');

  // Reference to the 'poordadrichdad' sub-collection
  CollectionReference poorDadRichDadCollection = bookDocument.collection('poordadrichdad');

  // Reference to the specific document in the 'poordadrichdad' collection (replace 'ykUIOTASOjelAYHTe5Fx' with your actual document ID)
  DocumentReference specificDocument = poorDadRichDadCollection.doc('ykUIOTASOjelAYHTe5Fx');

  try {
    // Get the document snapshot
    DocumentSnapshot documentSnapshot = await specificDocument.get();

    // Check if the document exists
    if (documentSnapshot.exists) {
      // Access the 'page1' field
      var page1Value = (documentSnapshot.data() as Map<String, dynamic>?)?['page1'] as String?;

      // var page1Value = documentSnapshot.data()?['page1'] ?? 'DefaultPage1Value';

      // var page1Value = documentSnapshot.data()?['page1'] as String;

      print('Value of page1: $page1Value');
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error reading document: $e');
  }
}
