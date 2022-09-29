class MangaModel {
   String? bookName;
   String? bookImage;
   String? author;
   String? link;
   String? description;
   String? year;
   String? rite;
   String? price ;

   MangaModel({
      required this.bookName,
      required this.bookImage,
      required this.author,
      required this.link,
      required this.description,
      required this.year,
      required this.rite,
      required this.price,
   });
   MangaModel.fromJson(Map<String, dynamic> json) {
      bookName = json['BookName'];
      bookImage = json['BookImage'];
      author = json['Author'];
      link = json['Link'];
      description = json['Description'];
      year = json['Year'];
      rite = json['Rite'];
      price = json['Price'];
   }

   Map<String, dynamic> toMap() {
      return {
         'BookName': bookName,
         'BookImage':bookImage,
         'Author': author,
         'Link': link,
         'Description': description,
         'Year': year,
         'Rite':rite,
         'Price':price,
      };
   }
}