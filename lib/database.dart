class Dates {
  final int year;
  final int month;
  final int day;

  const Dates({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  String toString() {
    return '$day/$month/$year';
  }
}

class Donor {
  final String profilePic;
  final String name;
  final int id;
  final String location;
  final double rating;
  final List<String> images;
  final Dates AddedOn;

  Donor({
    required this.profilePic,
    required this.name,
    required this.id,
    required this.location,
    required this.rating,
    required this.images,
    required this.AddedOn,
  });
}

class Item {
  final String name;
  final String category;
  final String cover;
  final double rating;
  final String productCode;
  final String description;
  final List<Donor> donors;
  final Dates dateAdded;
  final List<String> Item_Images;

  Item({
    required this.name,
    required this.category,
    required this.cover,
    required this.rating,
    required this.productCode,
    required this.description,
    required this.donors,
    required this.dateAdded,
    required this.Item_Images,
  });
}

class Database {
  static List<Donor> donors = [
    Donor(
        profilePic: "assets/images/profilePic.png",
        name: "Harsha",
        id: 29,
        location: "Pict",
        rating: 5.0,
        images: [
          "assets/images/books.png",
          "assets/images/clothes.png",
          "assets/images/dino.png",
          "assets/images/milkCan.png"
        ],
        AddedOn: const Dates(year: 2023, month: 08, day: 14)),
    Donor(
        profilePic: "assets/images/profilePic2.png",
        name: "Aditi",
        id: 41,
        location: "Pict",
        rating: 4.8,
        images: [
          "assets/images/fruits.png",
          "assets/images/laptop.png",
          "assets/images/books.png",
          "assets/images/fruits.png"
        ],
        AddedOn: Dates(year: 2024, month: 01, day: 01)),
    Donor(
        profilePic: "assets/images/profilePic.png",
        name: "Shravani",
        id: 27,
        location: "Pict",
        rating: 4.7,
        images: [
          "assets/images/laptop.png",
          "assets/images/clothes.png",
          "assets/images/dino.png"
        ],
        AddedOn: Dates(year: 2024, month: 02, day: 29)),
    Donor(
        profilePic: "assets/images/profilePic2.png",
        name: "Anshul",
        id: 37,
        location: "Pict",
        rating: 4.6,
        images: [
          "assets/images/blanket.png",
          "assets/images/milkCan.png",
          "assets/images/clothes.png"
        ],
        AddedOn: Dates(year: 2024, month: 03, day: 06)),
  ];

  static Map<String, Item> items = {
    "Blanket": Item(
        name: "Blanket",
        category: "Household",
        cover: "assets/images/blanket.png",
        rating: 5,
        productCode: "BL005",
        description:
            "Luxurious fleece blanket, designed to provide unparalleled warmth and comfort on chilly nights. Crafted with ultra-soft materials and available in a variety of elegant colors. It is the perfect addition to any bedroom or living space. Experience the ultimate relaxation and coziness with this premium fleece blanket today!",
        donors: [donors[3]],
        dateAdded: Dates(year: 2024, month: 03, day: 06),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
    "Books": Item(
        name: "Books",
        category: "Education",
        cover: "assets/images/books.png",
        rating: 4.8,
        productCode: "BOOK54",
        description:
            "Explore a treasure trove of knowledge with  diverse pile of books, meticulously curated to cater to every taste and interest. From timeless classics to contemporary bestsellers, there's something for everyone in this collection. Dive into a world of imagination and enlightenment with our handpicked selection of literary gems.",
        donors: [donors[0], donors[1]],
        dateAdded: Dates(year: 2024, month: 03, day: 05),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
    "T-Shirts": Item(
        name: "T-Shirt",
        category: "Clothing",
        cover: "assets/images/clothes.png",
        rating: 3.4,
        productCode: "TSHIRT122",
        description:
            "Get ready to elevate your casual wardrobe with this stylish pair of t-shirts! Crafted from premium cotton for maximum comfort, these versatile tees feature timeless designs and vibrant colors that effortlessly complement any outfit. Whether you're lounging at home or heading out for a casual outing, these t-shirts are a must-have addition to your collection.",
        donors: [donors[2], donors[3]],
        dateAdded: Dates(year: 2024, month: 02, day: 29),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
    "Dinosaur": Item(
        name: "Soft Toy Dinosaur",
        category: "Toys",
        cover: "assets/images/dino.png",
        rating: 5.0,
        productCode: "DINO001",
        description:
            "Unleash your child's inner paleontologist with our mesmerizing toy dinosaur! This captivating replica transports young adventurers to a world of prehistoric wonder, where endless imagination meets thrilling discovery. Crafted with exquisite detail, this roaring companion promises hours of Jurassic joy and exploration.",
        donors: [donors[0], donors[2]],
        dateAdded: Dates(year: 2020, month: 08, day: 14),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
    "Fruit Basket": Item(
        name: "Fruit Basket",
        category: "Food And Beverages",
        cover: "assets/images/fruits.png",
        rating: 4.8,
        productCode: "FRU2929",
        description:
            "Enjoy a variety of delicious fruits that are full of flavor and goodness! Our carefully chosen selection guarantees freshness and satisfaction, making snack time a tasty and nutritious delight. Bring the orchard to your home with our juicy fruits!",
        donors: [donors[1]],
        dateAdded: Dates(year: 2024, month: 03, day: 06),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png",
        ]),
    "Laptop": Item(
        name: "Laptop",
        category: "Electronics And Gadgets",
        cover: "assets/images/laptop.png",
        rating: 2.0,
        productCode: "LAP34",
        description:
            "Step up your gaming experience with our powerful gaming laptop! Designed for smooth gameplay and immersive graphics, this laptop is perfect for gaming enthusiasts of all levels. With fast processing and stunning visuals, it's your ticket to endless gaming excitement!",
        donors: [donors[1], donors[2]],
        dateAdded: Dates(year: 2021, month: 11, day: 14),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
    "Milk Can": Item(
        name: "Milk Can",
        category: "Food And Beverages",
        cover: "assets/images/milkCan.png",
        rating: 5.0,
        productCode: "MIL1212",
        description:
            "Quench your thirst with pure, creamy cow's milk straight from the farm! Packed with essential nutrients like calcium and protein, our milk is a wholesome choice for your daily needs. Treat yourself to the goodness of farm-fresh milk, perfect for drinking, cooking, or enjoying with your favorite cereal.",
        donors: [donors[0], donors[3]],
        dateAdded: Dates(year: 2024, month: 03, day: 07),
        Item_Images: [
          "assets/images/dino1.png",
          "assets/images/dino2.png",
          "assets/images/dino3.png",
          "assets/images/dino4.png"
        ]),
  };
}
