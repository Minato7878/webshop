INSERT INTO webshop.users(login, email, password ,first_name, last_name, date_of_birth) VALUES
("minato7878", "danylo.matviykiv@gmail.com", "123", "Danylo", "Matviykiv", "2000-04-26");

INSERT INTO products(product_name, product_desc, product_price, img) VALUES
("Anime Bag", "Nice Anime Bag", 220, "animebag.jpg"),
("Simple Bag", "Simple Bag", 100, "bag.jpg"),
("Bagpack", "Nice Anime Bag", 120, "bagpack.jpg"),
("Anime Cup", "Nice Anime Cup", 80, "cup1.jpg"),
("Anime Cup", "Nice Anime Cup", 70, "cup2.jpg"),
("Notebook", "DeathNote Notebook", 150, "deathnote.jpg"),
("Figures", "Nice Anime Figures", 300, "figures.jpg"),
("Manga", "Nice Manga", 320, "manga.jpg"),
("Overlord Manga", "Nice Overlord Manga", 320, "overlord.jpg"),
("Anime T-shirt", "Nice Anime T-shirt", 320, "mey.jpg"),
("Anime T-shirt", "Nice Anime T-shirt", 350, "ph.jpg"),
("Anime T-shirt", "Nice Anime T-shirt", 350, "senpai.jpg"),
("Anime T-shirts", "Nice Anime T-shirts", 500, "tshirts.png"),
("Notebook", "Naruto Notebook", 150, "notebook.jpg");

INSERT INTO categories(product_id, category_name) VALUES
(1, "bags"), (1, "new_collection"), (1, "small_carousel_1"),
(2, "bags"), (2, "new_collection"), (2, "big_carousel"),
("3", "bags"), (3, "new_collection"), (3, "small_carousel_1"),
("4", "accessories"), (4, "new_collection"), (4, "small_carousel_1"), (4, "xxx"),
("5", "accessories"), (5, "new_collection"), (5, "small_carousel_1"),
("6", "accessories"), (6, "new_collection"), (6, "small_carousel_2"),
("7", "figures"), (7, "new_collection"), (7, "big_carousel"),
("8", "manga"), (8, "new_collection"), (8, "big_carousel"),
("9", "manga"), (9, "new_collection"),
("10", "clothing"), (10, "new_collection"), (10, "small_carousel_2"),
("11", "clothing"), (11, "new_collection"), (11, "small_carousel_2"),
("12", "clothing"), (12, "new_collection"), (12, "small_carousel_2"), (12, "xxx"),
("13", "clothing"), (13, "new_collection"), (13, "big_carousel"),
("14", "accessories"), (14, "new_collection"), (14, "xxx");