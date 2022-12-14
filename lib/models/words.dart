// list of words

List<String> allWords = [
  'Miš', 'Tastatura', 'Zagrada', 'Ekran', 'Laptop', 'Dugme', 'Slovo', 'Broj',
  'Ranac', 'Lampa', 'Hemijska',
  'Marker', 'Tanjir', 'Viljuška', 'Novčanik', 'Majica', 'Šorc', 'Stolica',
  'Laser', 'Poklopac', 'Sto', 'Fioka',
  'Čarape', 'Slušalice', 'Telefon', 'Točkić', 'Sveska', 'Meso', 'Kolač', 'Kafa',
  'Ivica', 'Taster', 'Kamera',
  'Medalja', 'Dezodorans', 'Parfem', 'Traka', 'Kapiten', 'Ključevi', 'Duks',
  'Pantomima', 'Definicija', 'E-mail',
  'Skandirati', 'Posvećen', 'Stadion', 'Fudbal', 'Košarka', 'Tenis', 'Sport',
  'Šlag', 'Svetlost', 'Prekjuče',
  'Ograda', 'Rezerva', 'Peščara', 'Šupa', 'Sekira', 'Oktopod', 'Deblo',
  'Bogomoljka', 'Jastučnica', 'Vosak',
  'Trgovina', 'Često', 'Pismonoša', 'Želja', 'Svećnjak', 'Kompot', 'Auspuh',
  'Mantil', 'Čovek', 'Pas', 'Dete',
  'Kaktus', 'Slika', 'Činija', 'Čaša', 'Jastuk', 'Ljubav', 'Istina', 'Poštenje',
  'Moral', 'Obrazovanje', 'Laž',
  'Pokvarenost', 'Egoizam', 'Dobrota', 'Dvoličnost', 'Kafa', 'Daljinski',
  'Cveće', 'Rešetka', 'Internet', 'Bubašvaba',
  'Kengur', 'Facebook', 'Pločice', 'Pasoš', 'Cev', 'Kesa', 'Magnet',
  'Merdevine', 'Kutija', 'Fascikla', 'Amsterdam',
  'Apatin', 'Manastir', 'Roletne', 'Rajferšlus', 'Okvir', 'Stolnjak', 'Felna',
  'Minđuše', 'Mrav', 'Nosorog', 'Pegaz',
  'Tacna', 'Pertle', 'Čorba', 'Svadba', 'Verenica', 'Asistent', 'Kandilo',
  'Pozajmica', 'Skafander', 'Filter', 'Ćebe',
  'Leblebija', 'Komarnik', 'Ćilibar', 'Autentičnost', 'Krtola', 'Silos',
  'Pampur', 'Zamajac', 'Katoda', 'Poglavlje',
  'Kopito', 'Nakovanj', 'Zalistak', 'Nogar', 'Takmac', 'Vetrometina',
  'Pur-pena', 'Kopile', 'Furuna', 'Gležanj',
  'Mladež', 'Dukat', 'Hulahopke', 'Bluza', 'Tunika', 'Ešarpa', 'Najam', 'Iskaz',
  'Utvara', 'Amnestija', 'Haringa',
  'Dvoboj', 'Usek', 'Taster', 'Celibat', 'Čvor', 'Uzengija', 'Nakovanj',
  'Potkovica', 'Am', 'Mice', 'Katan', 'Libela',
  'Oblast', 'Osnovna', 'Opijum', 'Šerbet', 'Špatula', 'Šine', 'Relikvija',
  'Longeta', 'Gips', 'Daska', 'Imperator',
  'Pelet', 'Hladnjak', 'Kefir', 'Kajmak', 'Nadev', 'Rikošet', 'Olovo', 'Ćorak',
  'Pupoljak', 'Krmelj', 'Pliš', 'Somot',
  'Naredba', 'Melanholija', 'Seta', 'Čemer', 'Jad', 'Mehur', 'Opna',
  'Eksplozija', 'Pulpa', 'Platan', 'Nedođija', 'Pesticid',
  'Pejzaž', 'Sečivo', 'Mozaik', 'Legura', 'Vratolomija', 'Lovor', 'Testera',
  'Patuljak', 'Tenk', 'Jelek', 'Avokado', 'Detelina',
  'Vihor', 'Zavoj', 'Sanduk', 'Balalajka', 'Šasija', 'Odlaganje', 'Učkur',
  'Ponor', 'Ametist', 'Uvala', 'Toljaga', 'Beleg', 'Sablast',
  'Dnevnik', 'Teleportacija', 'Sinagoga', 'Seoba', 'Gljiva', 'Buka', 'Srča',
  'Sojenica', 'Simpozijum', 'Mušmula', 'Obrazac', 'Trezor',
  'Ćufte', 'Ćilim', 'Ćumur', 'Rese', 'Lampioni', 'Štrafte', 'Abažur', 'Ikebana',
  'Šišarka', 'Grgeč', 'Kristalizacija', 'Katalizator', 'Katjon',
  'Anjon', 'Đubrovnik', 'Magacin', 'Oscilacija', 'Koordinate', 'Kokošinjac',
  'Tučak', 'Prašnik', 'Džemper', 'Ajncer', 'Piksla', 'Krevet', 'Sveća',
  'Trenerka', 'Termos', 'Pleh', 'Ruter', 'Rokovnik', 'Saksija', 'Bajka',
  'Basna', 'Poslovica', 'Zagonetka', 'Registrator', 'Koverta', 'Korektor',
  'Klasa', 'Zarez', 'Tačka', 'Slovo', 'Reč', 'Rečenica', 'Definicija',
  'Teorema', 'Raditi', 'Plakati', 'Smejati se', 'Pisati', 'Kucati',
  'Telefonirati',
  'Pričati', 'Sanjati', 'San', 'Zatvor', 'Zatvoriti', 'Otvoriti', 'Poveriti se',
  'Verovanje', 'Ubeđenje', 'Nedostajanje', 'Nostalgija', 'Euforija',
  'Sastav', 'Diktat', 'Sanjiv', 'Ranjiv', 'Rana', 'Ožiljak', 'Smesa', 'Brašno',
  // Hrana i piće
  'Palačinke', 'Spanać', 'Hleb', 'Mleko', 'Kifla', 'Đevrek', 'Sir', 'Kačkavalj',
  'Sendvič', 'Kupus', 'Paradajz', 'Lazanje', 'Pire krompir', 'Gulaš',
  'Čorba', 'Pomfrit', 'Šnicle', 'Krastavac', 'Pasulj', 'Kelj', 'Brokoli',
  'Sarma', 'Prasetina', 'Ren', 'Beli luk', 'Boranija', 'Grašak', 'Pljeskavica',
  'Ćevapi', 'Rakija', 'Vino', 'Pivo', 'Špricer',
  // Predmeti
  'Lampa', 'Polica', 'Fioka', 'Ormar', 'Novčanik', 'Torbica', 'Pernica',
  'Slušalice', 'Privezak',
  'Sandale', 'Patike', 'Cipele', 'Mikrofon', 'Kabl', 'Kamera', 'Fotoaparat',
  'Stalak', 'Podmetač', 'Šerpa', 'Tiganj',
  'Lavor', 'Posuda', 'Escajg',
  // Misc
  'Didaskalija', 'Hiperbola', 'Novajlija', 'Koherentno', 'Koreografija',
  'Somelijer',
  'Repertoar', 'Municija', 'Arsenal', 'Astrounaut', 'Ambiciozan', 'Biskup',
  'Garnišna', 'Letimično', 'Vakcina'
];

// List<String> getWords() {
//   allWords.shuffle();
//   List<String> words = [];
//   for (int i = 0; i < master.numOfPlayers * 12; i++) {
//     words.add(allWords[i]);
//   }

//   return words;
// }

// List<String> playingWords = getWords();
List<String> playedWords = [];
List<String> playedInNormal = [];
List<String> playedInOne = [];
List<String> toPlayInPant = [];
