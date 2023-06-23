class Document {
  String? doc_title;
  String? doc_description;
  String? doc_url;
  String? doc_date;
  int? page_num;

  Document(this.doc_title, this.doc_url, this.doc_description, this.doc_date,
      this.page_num);

  static List<Document> doc_list = [
    Document(
        "Artifical intelligence",
        "assets/pdf/122-SOUDOPLATOF_2018-02-16.pdf",
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "2018-02-16",
        60),
    Document(
        "Artifical intelligence",
        "assets/pdf/UPL4485925235409209505_Intelligence_Artificielle.pdf",
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "8-08-2015",
        7),
    Document(
        "The impact of artificial",
        "https://www.college-de-france.fr/media/yann-lecun/UPL4485925235409209505_Intelligence_Artificielle______Y._LeCun.pdf",
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "8-08-2015",
        10),
  ];
}
