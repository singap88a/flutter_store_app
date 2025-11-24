class Product {
  final int id, price;
  final String title, subTitle, description, image, category;
  final double rating;
  final int discountPercentage;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
    this.rating = 4.5,
    this.discountPercentage = 0,
    this.category = "إلكترونيات",
  });

  // Calculate old price based on discount
  int get oldPrice {
    if (discountPercentage > 0) {
      return (price * 100 / (100 - discountPercentage)).round();
    }
    return price;
  }
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات لاسلكية",
    subTitle: "جودة صوت عالية",
    image: "images/airpod.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.8,
    discountPercentage: 15,
    category: "سماعات",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "images/mobile.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.9,
    discountPercentage: 10,
    category: "هواتف",
  ),
  Product(
    id: 3,
    price: 39,
    title: "نظارات ثلاثية الأبعاد",
    subTitle: "لنقلك للعالم الافتراضي",
    image: "images/class.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.2,
    discountPercentage: 0,
    category: "اكسسوارات",
  ),
  Product(
    id: 4,
    price: 56,
    title: "سماعات",
    subTitle: "لساعات استماع طويلة",
    image: "images/headset.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.5,
    discountPercentage: 20,
    category: "سماعات",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "images/speaker.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.0,
    discountPercentage: 5,
    category: "صوتيات",
  ),
  Product(
    id: 6,
    price: 39,
    title: "كاميرات كمبيوتر",
    subTitle: "بجودة ودقة صورة عالية",
    image: "images/camera.png",
    description:
        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
    rating: 4.6,
    discountPercentage: 0,
    category: "كاميرات",
  ),
];
