class Document {
  String? doc_title;
  String? doc_description;
  String? doc_url;
  String? doc_date;
  int? page_num;
  String? doc_image;

  Document(
    this.doc_title,
    this.doc_url,
    this.doc_description,
    this.doc_date,
    this.page_num,
    this.doc_image,
  );

  static List<Document> doc_list = [
    Document(
      "Introduction au html",
      "https://www.i3s.unice.fr/~jplozi/intro_web_2015/cours/intro_web_2.pdf",
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "2018-02-16",
      60,
      'assets/images/image1.png',
    ),
    Document(
      "Artificial Intelligence",
      "../../assets/pdf/122-SOUDOPLATOF_2018-02-16.pdf",
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "8-08-2015",
      7,
      'assets/images/image2.png',
    ),
    Document(
      "The Impact of Artificial",
      "https://www.college-de-france.fr/media/yann-lecun/UPL4485925235409209505_Intelligence_Artificielle______Y._LeCun.pdf",
      "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "8-08-2015",
      10,
      'assets/images/image4.png',
    ),
  ];
}
