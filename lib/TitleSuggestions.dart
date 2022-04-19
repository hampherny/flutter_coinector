class TitleSuggestions {
  static final reviewedTitles = const {
    "Las Delicias de Vicenta",
    "Di-Masi Vinos C.A.",
    "VIMAS GROUP",
    "Pollos Don Guillo, Carrera 65 ##38-03, Medellín",
    "Gtech maracay, Maracay, Aragua",
    "Digitel Estación Central, Maracay, Aragua",
    "Todo Cable Center, C.A., Maracay, Aragua",
    "Ferramenta R y S, C.A., Maracay, Aragua",
    "Hierro Maracay, Avenida Bolívar, Maracay, Aragua",
    "Ferreled Center, C.A., Sector Farenachi, Maracay, Aragua",
    "Hotel Mar de Plata, Maracay, Aragua",
    "El conde hotel, Avenida Miranda, Maracay, Aragua",
    "Wok Asían Food",
    "La Kolacheria, Aragua",
    "Ola Pop Bar, maracay, Aragua",
    "Mahalo poke, Maracay, Aragua",
    "ORGANI´K, Maracay, Aragua",
    "Supermercado Luxor, Maracay, Aragua",
    "Baraki Bodegon, Maracay, Aragua",
    "Noa Noa Show & Cocteles, Avenida Las Delicias, Maracay, Aragua",
    "Krispy Donuts Coffee & Lunch, Avenida Las Delicias, Maracay, Aragua",
    "Bossa Café, Avenida Las Delicias, Maracay, Aragua",
    "Campo verde minimarket, sector corozal 1, Maracay, Aragua",
    'Pura Vida Cuyagua Surf y Moda Playera, Cuyagua, Venezuela',
    "Cacao's Canela, El Castano, Maracay, Venezuela",
    "Supermercado Walio, El Castano, Maracay, Venezuela",
    'Posada Casa Grande, Cuyagua, Venezuela',
    'Bodegón El Saman Cuyaguero, Cuyagua, Venezuela',
    'Kullawa Shop, Cuyagua, Venezuela',
    'metromercados, Heredia, Costa Rica',
    'Newpoint, Cuyagua, Venezuela',
    'Nigiriya Hachibe, 3 Chome-28 Kanda Sakumacho, Chiyoda, Tokio, Japón',
    'ジェムキャッスルゆきざき 東京本店, Japón, 〒106-0032 Tokyo, Minato City, Roppongi5 Chome−16−1 ',
    'ジェムキャッスルゆきざき 東京ロレックス専門館, Japón, TokioMinatoRoppongi3 Chome−11−10 ',
    'Erawan Thai Traditional Massage - Akasaka, Tokyo (エラワンタイ古式マッサージー赤阪), 6 Chome-6-3-19 Akasaka, 港区 Minato, Tokio, Japón',
    'Irish Pub Craic Akasaka, 2 Chome-6-14 Akasaka, Minato, Tokio, Japón',
    'DÖBRÖGI Hungarian Bar & dining, Japan, Tokyo, Minato City, Akasaka2 Chome−１２−11 ',
    'Le Petit Tonneau, 2 Chome-1-1 Toranomon, Minato, Tokyo, Japón',
    'LittleGarden, 5 Chome-6-8 Ginza, Chūō, Tokio, Japón',
    'GC Yukizaki, 8 Chome-7-22 Ginza, Chūō, Tokio, Japón',
    'BANK30, Japan, Tokyo, Minato City, Kaigan, 1 Chome−１０−45 ',
    'Japan National Stadium, 10-1 Kasumigaokamachi, Shinjuku, Tokio, Japón',
    'Bar BASHI, 1 Chome-23-5 Ebisuminami, Shibuya, Tokio, Japón',
    'hair make MINT, Japan, 〒150-0022 Tokyo, Shibuya City, Ebisuminami, 2 Chome−９−8 ',
    'Ebisu Yokocho, 1 Chome-7-4 Ebisu, Shibuya, Tokio, Japón',
    'ラブレ・フランス語教室, Japón, TokioShibuyaJingumae, 4 Chome−18−6 ',
    'OIL&VINEGAR RESTAURANT 瑞穂, Japón, TokioMeguroJiyugaoka, 2 Chome−8−8 ',
    'Coaster Craft Beer & Burger コスター・クラフトビール＆バーガー, 5 Chome-19-13 Daizawa, Setagaya, Tokio, Japón',
    'はたもカイロ整体院, Japón, TokioNakanoNogata, 6 Chome−8−4 ',
    'ホルモンすず 多摩永山店, Japón, TokioTamaNagayama, 1 Chome−８−17 ',
    'Alex Live, 1 Chome-18-8 Minowacho, Kōhoku-ku, Yokohama, Prefectura de Kanagawa, Japón',
    'こりもみはんど, Japón, Prefectura de KanagawaYokohamaMinami Ward, Idogaya Shimomachi, 47-5 ',
    'Narita International Airport, 1-1 Furugome, Narita, Prefectura de Chiba, Japón',
    '堀川工房, Japón, Prefectura de NaganoAzuminoHotakakashiwabara, 2260-10 ',
    'Lucky 29, 2 Chome-4 Higashishinsaibashi, Chūō-ku, Osaka, Prefectura de Osaka, Japón',
    'ジェムキャッスルゆきざき 心斎橋筋商店街店, Japón, Prefectura de OsakaOsakaChūō-kuShinsaibashisuji, 2 Chome−6−1',
    'OKINAWA MINSYUKU KARIYUSHI1, Shirahama, Wakayama, Japan',
    'HIKARI CLINIC (ひかりクリニック）, Japan, Okayama, Kita Ward, Shimoishii, 2 Chome−1−18 ORIX',
    'Kyushu Diamond Center (KDC) 九州ダイヤモンドセンター, Japan',
    'Gem Castle Yukizaki Nakasu, Japan',
    'ジェムキャッスルゆきざき 福岡本店 高級時計, Japan, 〒810-0001 Fukuoka, Chuo Ward, Tenjin, 2 Chome−6−14 ゆきざきビル',
    'ジェムキャッスルゆきざき 福岡セレクト館, Japan',
    'Yakiniku Nurubon, 焼肉ヌルボン 大名Kitchen, Japan',
    'Yuji Kajiwara ゆうじ・かじわらの店, Japan',
    'ジェムキャッスルゆきざき 熊本店, Japan',
    'The Scone Shack, Cape Town, South Africa',
    'JMK Apartment Rentals, Cape Town, South Africa',
    'Nduli, Ceres, South Africa',
    'Citihoppers (Pty) Ltd, Joubertina, South Africa',
    "Chez Fernand la French Bakery, Marigot, Saint Martin ",
    "Boutique Lafayette, Rue de la Liberté, Marigot, Saint Martin ",
    "WATERFRONT GROCERY",
    "La Terrasse Restaurant, Marigot, Saint Martin ",
    "Catherines Café, Piccadilly, Antigua and Barbuda ",
    "Club House, Falmouth, Antigua and Barbuda ",
    "Axxess Marine, next to Marine, English Harbour, Antigua and Barbuda ",
    "Skullduggery Cafe, English Harbour, Antigua and Barbuda ",
    "Skullduggery's Cafe, Piccadilly, Antigua and Barbuda ",
    "Paparazzi Pizzeria & Bar, Antigua and Barbuda ",
    "Colibri Bistro Bar Lounge, Antigua and Barbuda ",
    "5 Senses Restaurant, Antigua and Barbuda ",
    "Antigua Yacht Club Marina & Resort, Antigua and Barbuda ",
    "Clean Food'N Jooce, St. John's, Antigua and Barbuda",
    "Sheer Rocks, St Johns, Antigua and Barbuda ",
    "Fort Medieval, Antigua and Barbuda ",
    "The Cool Pool, Antigua and Barbuda ",
    "West Coast Village, Antigua and Barbuda ",
    "Steph & Vlada’s Studio, Jolly Harbour, Antigua and Barbuda ",
    "Akropolis Greek Restaurant, and barbuda, Antigua and Barbuda ",
    "Basilico Italian Restautant | Antigua, Jolly Harbour, Antigua and Barbuda ",
    "Relocate Antigua | Relocation Services Antigua, Antigua and Barbuda ",
    "Creole Antigua Tours, Jolly Harbour, Antigua and Barbuda ",
    "Barefoot Antigua, Antigua and Barbuda ",
    "Al Porto, Jolly Harbour, Antigua and Barbuda ",
    "Townhouse Megastore, American Road, Antigua and Barbuda ",
    "Twist Fitness, Twist Mall, 3rd floor, Saint John's, Antigua and Barbuda ",
    "Quay Necessities, Redcliffe Street, Saint John's, Antigua and Barbuda ",
    "Diamond Republic, Saint John's, Antigua and Barbuda ",
    "The Athletes Foot (#416), Saint John's, Antigua and Barbuda ",
    "Hemingway's Caribbean Cafe, Saint Mary's Street, Saint John's, Antigua and Barbuda ",
    "TWIST Mall, Saint John's, Antigua and Barbuda ",
    "Hill & Hill Attorneys at Law, Long Street, St John's, Antigua and Barbuda ",
    "Electronics Now Repair Centre, Church Street, Saint John's, Antigua and Barbuda ",
    "Spices of India, Friars Hill Road, Saint John's, Antigua and Barbuda ",
    "Green Sea's Restaurant, Saint John's, Antigua and Barbuda ",
    "The Vineyard, Antigua and Barbuda ",
    "NOMAD RESTAURANT, Antigua and Barbuda ",
    "Stella Ristorante, Sunset Lane, Saint John's, Antigua and Barbuda ",
    "Kon Tiki Bar and Grill, Dickenson Bay St, Saint John's, Antigua and Barbuda ",
    "Ana's on the Beach, s, Antigua, Antigua and Barbuda ",
    "M & M Service Station, Piggotts, Antigua and Barbuda ",
    "North Coast Hardware, Friars Hill Road, St John's, Antigua and Barbuda ",
    "Ticchio Italian Food and Wine, Sir George Walter Highway, Saint John's, Antigua and Barbuda ",
    "2M Heavy Enterprises, Sir George Walter Highway, Piggotts, Antigua and Barbuda ",
    "SSID Financial Ltd., Piggotts, Antigua and Barbuda ",
    "The Tailor's Daughter, Redcliffe Street, Saint John's, Antigua and Barbuda ",
    "Garden Grill, Antigua and Barbuda ",
    "Northside EZ Grab, and Barbuda, Antigua and Barbuda ",
    "Hodges Bay Resort & Spa, Antigua and Barbuda ",
    "Carib Jack Group, Charlestown, Saint Kitts and Nevis ",
    "Turtle Time Bar & Grill, Vaughans, Saint Kitts and Nevis ",
    "Indian Summer, Cotton Ground, St Kitts & Nevis ",
    "Spice Mill Restaurant, New Castle, Saint Kitts and Nevis",
    "Carambola Beach Club, Kittian Village, Saint Kitts and Nevis ",
    "St.Kitts Water Sports Center, Saint Kitts and Nevis ",
    "Lotus Thai Bistro, Saint Kitts and Nevis",
    "Koi Resort Saint Kitts, Curio Collection by Hilton, Saint Kitts and Nevis",
    "Corporate Solutions Ltd., Saint Kitts and Nevis ",
    "Shawarma King 3 Frigate Bay, Saint Kitts and Nevis ",
    "St. Kitts Castle Condos, Saint Kitts and Nevis ",
    "Timo Pizza Pasta & More, Basseterre, St Kitts & Nevis",
    "Timo Pizza Pasta & more.., St. Kitts, Basseterre, St Kitts & Nevis ",
    "SHAW NETWORK, Saint Kitts and Nevis ",
    "Aqua Lounge & Bar, Saint Kitts and Nevis ",
    "Karma Asian Cuisine, Saint Kitts and Nevis ",
    "Courtesy Rent A Car, Basseterre, Saint Kitts and Nevis ",
    "Last Lap, Basseterre, Saint Kitts and Nevis ",
    "Spice Of India, St Kitts, Saint Kitts and Nevis",
    "The Jerk Pit, Basseterre, Saint Kitts and Nevis",
    "Shawarma King, Basseterre, Saint Kitts and Nevis ",
    "Alluring Shades MUA✨🌸, Basseterre, Saint Kitts and Nevis ",
    "Sun Island Clothes, St. Kitts, Southwell Street, Basseterre, Saint Kitts and Nevis",
    "ISLAND HEALTH STATION, Basseterre, Saint Kitts and Nevis ",
    "The St Kitts Resort wear, Basseterre, Saint Kitts and Nevis ",
    "Gems & Jewels, Basseterre, Saint Kitts and Nevis ",
    "RK Gems St. Kitts, Saint Kitts and Nevis ",
    "PRINT-HUB SKN, Saint Kitts and Nevis ",
    "The Weird Fish Store, Saint Kitts and Nevis ",
    "Cyberlink St. Kitts, Basseterre, Saint Kitts and Nevis ",
    "I LOVE ST. KITTS STORE, Saint Kitts and Nevis ",
    "Island Treasures, Basseterre, Saint Kitts and Nevis ",
    "Marley's, Kittian Village, Saint Kitts and Nevis ",
    "LatinHouseGC, Saint Kitts and Nevis ",
    "GOLD MINE ST. KITTS, Saint Kitts and Nevis",
    "Noble Jewelers St. Kitts, Saint Kitts and Nevis ",
    "Royal Gems, Saint Kitts and Nevis ",
    "Cariloha and Del Sol, Saint Kitts and Nevis",
    "Glitter Jewelry, Basseterre, Saint Kitts and Nevis ",
    "Cheers, Basseterre, Saint Kitts and Nevis ",
    "The Gelato Shop St Kitts, Basseterre, Saint Kitts and Nevis ",
    "Port Zante Food Court, Basseterre, Saint Kitts and Nevis ",
    "Adonis Tour & Beach from Porte Zante, Basseterre, Saint Kitts and Nevis ",
    "Smart Electronics, Saint Kitts and Nevis ",
    "Captain Jack's Treasure Chest, Basseterre, Saint Kitts and Nevis ",
    "Lemongrass, Basseterre, St Kitts & Nevis ",
    "Paradise bar & grill, Basseterre, Saint Kitts and Nevis ",
    "Sol Gas Station, Victoria Road, Basseterre, Saint Kitts and Nevis ",
    "Serendipity Restaurant, Wigley Avenue, Saint Kitts and Nevis ",
    "Oracle Martial Arts Academy / St. Kitts BJJ, Brumaire, Saint Kitts and Nevis ",
    "Shanghai Xpress, Brumaire, Saint Kitts and Nevis ",
    "Sangria, Brumaire, Saint Kitts and Nevis ",
    "Sugar N Spice, Charlestown, Saint Kitts and Nevis",
    "Delhi Belly, St. Kitts, Basseterre, Saint Kitts and Nevis ",
    "Azitra Cafe, Saint Kitts and Nevis ",
    "CocoPlums Garden Bar & Grill, Cleverly Hill, Sandy Point Town, Saint Kitts and Nevis ",
    "Angelo's Int Ltd, Brades, Montserrat ",
    "Shack-A-Kai, Antigua and Barbuda ",
    "Lounge Barons de Rothschild, Gustavia, Saint Barthélemy ",
    "La Crepêrie & Restaurant, 97133, Rue de la France, Gustavia 97133, Saint Barthélemy ",
    "Bitcoin.ai Ltd., The Quarter, Anguilla ",
    "IWAS@TheBar, Swing High Road, The Valley, Anguilla",
    "The Safety Pelican, Sint Maarten ",
    "Caribbean Brewing Company - San Martin Beer, Goldfinch Rd., Sint Maarten ",
    "Coffee Lounge, Philipsburg, Sint Maarten ",
    "Joshua Rose Guest House, Emma Plein, Philipsburg, Sint Maarten ",
    "COLORS, Back Street, Philipsburg, Sint Maarten ",
    "SPORTS GALLERY, Back Street, Philipsburg, Sint Maarten ",
    "Landmark Variety Outlet, Back Street, Philipsburg, Sint Maarten ",
    "Desire Fashions, Back Street, Philipsburg, Sint Maarten",
    "Lucky Cosmetics 2, Back Street, Philipsburg, Sint Maarten",
    "Diamonds & Design, Front Street, Philipsburg, Sint Maarten ",
    "Amasterdam, Front Street, Philipsburg, Sint Maarten ",
    "Duty Free Plaza, Front Street, Philipsburg, Sint Maarten ",
    "Classic Electronics, Back Street, Philipsburg, Sint Maarten ",
    "Shams, C.A. Cannegieter Street, Philipsburg, Sint Maarten ",
    "Holland House, Front Street, Philipsburg, Sint Maarten ",
    "FRIENDLY DUTY FREE-2, Front Street, Philipsburg, Sint Maarten ",
    "Klass Electronics, Front Street, Philipsburg, Sint Maarten ",
    "Ultimate Jewelers, Front Street, Philipsburg, Sint Maarten ",
    "Alpha Jewels, Front Street, Philipsburg, Sint Maarten ",
    "Shiva's Gold and Gems, Front Street, Philipsburg, Sint Maarten ",
    "Dutch Blonde, Boardwalk, Philipsburg, Sint Maarten ",
    "Rays Jewelry, Front Street, Philipsburg, Sint Maarten ",
    "Print & Sign Express, C.A. Cannegieter Street, Philipsburg, Sint Maarten",
    "First Response N.V., Philipsburg, Sint Maarten ",
    "La caleta restaurant, Walter A. Nisbeth Road, Philipsburg, Sint Maarten ",
    "Kam's Foodworld, Philipsburg, Sint Maarten ",
    "Oasis Food & Drinks, A.T. Illidge Road, Philipsburg, Sint Maarten ",
    "Tiremaxx, Zagersgut Road, Sint Maarten ",
    "Rick's, Bush Road, Philipsburg, Sint Maarten ",
    "Tech Hub, Bush Road, Philipsburg, Sint Maarten",
    "Victors Cosmetics & More, Sint Maarten",
    "Champion bites restaurant, Cole Bay, Sint Maarten ",
    "Animal Hospital St. Maarten, Union Road, Cole Bay, Sint Maarten ",
    "Le Pizza Club, Port de Plaisance, Cole Bay, Sint Maarten ",
    "SXM Beer, Locas Tree Drive, Cole Bay, Sint Maarten",
    "Coffee lounge 2.0, Welfare Road, Cole Bay, Sint Maarten",
    "VIVASIGNS, Welfare Road, Simpson Bay, Sint Maarten ",
    "Movida, Simpson Bay, Sint Maarten ",
    "Avantika, Sint Maarten ",
    "Lotus Nightclub Sxm, Welfare Road, Simpson Bay, Sint Maarten ",
    "Cocky Turtle Beach Bar & Restaurant, Kimsha Beach, Simpson Bay, Sint Maarten",
    "Roxxy Beach Bar & Restaurant, Welfare Road, Simpson Bay, Sint Maarten ",
    "Astra, Welfare Road, Simpson Bay, Sint Maarten ",
    "Nowhere Special, Welfare Road, Simpson Bay, SXM, Sint Maarten ",
    "Red Diamond, Simpson Bay, St. Maarten, Sint Maarten ",
    "Smart Car Rental, Simpson Bay Road, Simpson Bay, Sint Maarten ",
    "Beirut sxm, 29 Airport Rd, Simpson Bay, Sint Maarten ",
    "Sale & Pepe Marina SXM, Welfare Road, Simpson Bay, Sint Maarten ",
    "Sea Grapes International, Simpson Bay, Sint Maarten ",
    "AMA Jewellers, Airport Road, Simpson Bay, St. Maarten, Sint Maarten ",
    "Chabad of St. Martin, Simpson Bay, Sint Maarten ",
    "Sint Maarten, Rhine Road, Alina restaurant ",
    "Mimosa Skylounge, Rhine Road, Sint Maarten ",
    "Tortuga Maho, Sint Maarten ",
    "Sunita's Taxi St Maarten, Simpson Bay, Sint Maarten ",
    "Jax Steakhouse, Rhine Road, Maho bay, Sint Maarten ",
    "Radisson Jewels, Sint Maarten, Sint Maarten",
    "3 Amigos, Rhine Road, Sint Maarten",
    "Sublime Resto.Bar, Sint Maarten",
    "J.N. Jewelers, Sint Maarten, Sint Maarten ",
    "Moonbarb Rooftop, 7 Rhine Rd, Sint Maarten",
    "Jewels & Beyond, Cinnamon Grove, Sint Maarten ",
    "Incredible Fitness & More, Rhine Road, Philipsburg, Sint Maarten",
    "Studio Fam Hair Salon & Spa, Sint Maarten, Sint Maarten",
    "Stevez Bar, Rhine Road, Sint Maarten",
    "Be you by Perrine, Rue de la Liberté, Marigot, Saint Martin",
    "Icon, Marigot 97150, Saint Martin",
    "TROPISMES GALLERY, Boulevard de Grande Case, Grand Case, Saint Martin",
    "ICI PARIS, Rambaud, Saint Martin",
    "Concept Powersport (SUZUKI SXM), Sandy Ground, Saint Martin ",
    "Swing Barth, Sint Maarten ",
    "Rendez Vous Lounge, Sint Maarten, Sint Maarten",
    "Cambuci, Sint Maarten, Sint Maarten ",
    'The Block, Lisboa',
    'Sailing Munich, Munich, Germany',
    'Joel Crepes, The Headrow, Leeds',
    "TIMELESS SPIRITS, Rue du Président Kennedy, Marigot, Saint Martin ",
    "Country House La Grancia, Treia, Macerata, Italy",
    "SURF'ACE Saint Martin, Marigot, Saint Martin",
    "Doravila Restaurante C.A",
    "Kuang Hua",
    "Spa Beautiful Fitness",
    "La Spezia Cafe",
    "Casa Torino",
    "Toromaima mini market",
    "Juan Express Licores",
    "Bodegón Daroy",
    "Monumental Tours C.A",
    "Kiosco Mene Grande",
    "Inversiones exótica doris",
    "A Granel",
    "HOTEL GIRASOL70",
    "El Compy Delicias venezolanas",
    "Smash Avocaderia Poblado",
    "La Tia o ladraba",
    "SimCardRental",
    "Bar Restaurant el Naranjal",
    "Erylyn Moda C.A",
    "Envicargo",
    "La Red Ciber Cafe",
    "American Book Shop 2026",
    "Arte Express 99",
    "Global Systems Store C.A",
    "Contenedor de Acción",
    "Comercializadora San Varca, C.A",
    "Riquísimo",
    "Romano's Fábrica de Muebles en madera",
    "Kiosco Andres Bello",
    "Rikway Shop",
    "Go Producciones",
    "Papelería Moderna",
    "Farmacia Parque Cristal",
    "Gürt Cocina Vegetariana",
    "Gigi Playa",
    "Hostal el Regreso",
    "SimCardRental Colombia",
    "HUGONODONTE Café",
    "Café Sushi One 2017, C.A",
    "Badi Import, C.A",
    "Sastreria Camargo",
    "HABITACOM",
    "Lion Tech",
    "SimCardRental Valencia",
    "Distribuidora Okli's, C.A",
    "Kanji sushi",
    "Cafeteria y Pasteleria Manolo",
    "La Mejor Paella de Caracas",
    "phone star solutions c.a",
    "Soluciones CGT",
    "Techmania BC C.A",
    "Panaderia Pasteleria La Petit Folie Bakery",
    "Inversiónes Santi 28",
    "MULTISERVICIOS VORTEX 1337",
    "Inversiones JHR",
    "Farma Shop Chacao",
    "Distribuidora DIMPERCA",
    "Coffe Party Ciber",
    "Bodegón y Delicateses La Esmeralda",
    "Inversiones Yumarca 44, C.A",
    "Coffe Party Piñateria",
    "Superformica C.A",
    "Grupo Global Tec 2724, C.A",
    "Genius Machine Import, C.A",
    "Bluaxcel, C.A",
    "Moder Cell AD 2021",
    "ADVERSUM5",
    "Inversiones Mundo Androide M.A C.A",
    "Artstore_70",
    "Moto Repuestos El MArquez",
    "AquaFull",
    "Panaderia Y Pasteleria Monquita",
    "Crunch - Costillas & Alitas",
    "Mercería Tejeycrea",
    "Fergia's Studio's",
    "La Tostadita",
    "Digital Security",
    "Restaurante JG",
    "Kiosco Las Palmas",
    "W&BEYELASH",
    "Inversiones Farmacia Del Este",
    "Fashion View Óptica",
    "Restaurante Doña Barbara",
    "Margaritas Cakes Caracas",
    "Tu Dulce Tentación Caracas",
    "Panadería Regal",
    "Inversiones JADM 2016, C.A",
    "Inversiones Tinna C.A",
    "Infiniti Cell C.A",
    "Zetron",
    "Stephinet Solutions",
    "Don Manuel Grill",
    "Majagua bar Caracas",
    "Charcuteria y Carniceria MR",
    "Quiosco Central",
    "Supermercado Negrin",
    "Feria del Pan Chacao",
    "Comercializadora de Alimentos 218 C.A",
    "Cyber Café JKVO C.A",
    "Quiosco Mifla",
    "Restaurant El Semáforo",
    "Donde Siempre",
    "Quisco Yosiani",
    "Kiosco Betania",
    "Moto Repuestos El Ruso",
    "El portal MiniMarket",
    "Casona Gourmet",
    "Hotel Royal",
    "Abasto y Perfumería los Tres Casiques",
    "Distribuidora Alfredroame",
    "Restaurant Royal",
    "Kiosko Alexmar",
    "Inversiones MM 2020",
    "Comercializadora el Rincón del Gordo Juanky, C.A",
    "Inversiones Moncherri One, C.A",
    "Edgar Yanez Repostería",
    "Centro de Copiado Speed Copy J & G",
    "Importadora 212",
    "Optimoda",
    "Hamaca Cafe",
    "Bar Madrigal 911",
    "COCO CANDY",
    "Purificadora de agua alda",
    "Kiosco El Poeta",
    "Kiosco Elice",
    "Tasca Restaurant Madame Fru Fru",
    "Kiosco El Toldito Amarillo",
    "Inversiones Bella 2012 C.A.",
  };
  static final titleTags = const {
    'Muerde La Carne',
    'Caffe Meranto',
    'Meranto',
    'Las Empanadas de Simon',
    'Empanadas de Simon',
    'Posada El Oasis',
    'Fanatic Sport',
    'Steak Burger',
    'La Soga',
    'LItalia',
    'Urban Pizza',
    '1903',
    'Veruca Salt',
    'Altos del Este',
    'MiniGolf',
    'Windschief',
    'Beach',
    'Casa Sofia Inn',
    'Maya Lous Place',
    'Artehelado Villahermosa',
    'Plaza',
    'City Center',
    'Rempah Rempah',
    'Peoples Pub',
    'Figures',
    'Kirbys Q',
    'STREETza 360',
    'Liars Bench',
    '3S Artspace',
    'STREET eat-drink 360',
    'La Maison Navarre',
    'Fezziwigs',
    'The Bold Mariner Brewing Company',
    'Brew',
    'Bold Mariner Brewing Company',
    'La Sirene Upper West Side',
    'La Sirene',
    'MAMACHA',
    'Korean Spring',
    'Mystic Water Kava Bar',
    'Trevi Pasta',
    'Bandung Indonesian Restaurant',
    'City Lounge',
    'Luminous Brewhouse',
    'Mill Inn',
    'Classic Crust Pizza',
    'Apia Inn Samoa',
    'Sushi-Bar Numazuko',
    'Numazuko',
    '回転寿司酒場',
    '銀座沼津港',
    'Villa Vveden',
    'Введенье',
    'Береговая',
    'MEZZO Luxury Bar n Lounge',
    'daikanyama OKOK',
    'Cafe de Perle',
    'カフェ・ド・ペルル',
    'Two Dogs Taproom',
    'トゥー·ドッグス·タップルーム',
    'The Pink Cow Akasaka',
    '赤坂 The Pink Cow (ピンクカウ)',
    'Pink Cow',
    'The Pink Cow',
    'ピンクカウ',
    '赤坂',
    'Downtown Bs Indian Kitchen',
    'Kitchen',
    'ダウンタウン ビーズ',
    'f,line',
    'エフライン',
    'Kagurazaka aka be e tasuki',
    '神楽坂 あかべえ 襷｜神楽坂 焼き鳥 ワイン 日本酒',
    'New Salsa Sudada',
    'サルサスダーダ',
    'Good Heavens',
    'Greek bar',
    'ギリシャ小町三丁目',
    'Bar Golden',
    'Golden',
    'Gluten Free 61',
    '330BAR 私を恵比寿に連れてって',
    '私を恵比寿に連れてって',
    'RAKAN TOKYO',
    'Kawashou',
    'うなぎ 川昌',
    'Soul Food House',
    'ラ コシーナ デ ゲン - la cocina de gaston',
    'la cocina de gaston',
    'RicePlus（ライスプラス）',
    'ライスプラス',
    'Hackers Bar',
    'GYOZA SHACK',
    'Yakiniku Tamura - 北海道の旬 焼肉たむら',
    '北海道の旬',
    '焼肉たむら',
    'オサル コーヒー osaru coffee',
    'osaru coffee',
    '喫茶・軽食 ユニティーフェイス - Unity Faith',
    'Unity Faith',
    'ENGARO organic hair clinic 大阪市北区大淀南オーガニック美容室',
    '大阪市北区大淀南オーガニック美容室',
    '仮想通貨カフェ＆バーＣＯＩＮＳ',
    'ＣＯＩＮＳ',
    '04village',
    'なんば',
    'cycle-cafe TRI⊿NGLE',
    'TRI⊿NGLE',
    'bit cafe',
    'Slices Pizza Restaurant',
    'スライシーズ',
    'toripao - 鶏料理pao',
    '鶏料理pao',
    'ナジミチヂミ Izakaya Restaurant',
    'Izakaya',
    '味乃家 2号店',
    'Ajinoya 2nd Shop - 味乃家 2号店',
    '炭火焼肉たむら福岡店 - Yakiniku Tamura Fukuoka',
    'Yakiniku Tamura Fukuoka',
    '炭火焼肉たむら 長崎店 - Yakiniku Tamura Nagasaki',
    'Yakiniku Tamura Nagasaki',
    'DUCATUS CAFE Bali',
    'Ducatus Cafe Singapore',
    'BUNK 5021 HOSTEL',
    'Pattaya Beer Garden',
    'Cocotte Soi',
    'Catmosphere Cat Cafe',
    'Gringo Loco Cantina',
    'Cantina',
    'Francescas Bar',
    'Platform 62',
    'Spawn Point Small Bar',
    'La Stazione Bakery n Cafe',
    'Port Stephens Motel',
    'Nutrient Depot',
    'Stone n Wood Brewing Company',
    'Brewing Company',
    'Next Hotel Brisbane',
    'Brew Cafe n Wine Bar',
    'X CARGO - Beer Garden',
    'Boroughs of New York Wood fire Pizza',
    'New York',
    'Nom Nom Korean Eatery',
    '5 Dogs',
    'Stephs Cafe',
    'Ovolo The Valley - 5 Star Hotel',
    'Spoon Deli Cafe',
    'Airport',
    'The Botanist Kitchen And Bar',
    'Burger Urge DFO skygate',
    'Windmill n Co - Bar n Bistro',
    'Red Rooster',
    'Mad Mex Fresh Mexican Grill',
    'Mad Mex',
    'SumoSalad',
    'Giancarlo Coffee',
    'Wasabi Warriors',
    'Lagoons 1770 Resort n Spa',
    '1770',
    '1770 Southern Cross Backpackers',
    'Southern Cross Backpackers',
    'Getaway Garden Cafe',
    'Agnes Water Tavern',
    'Cafe Discovery',
    'Backpackers @ 1770',
    'Green Turtle Brasserie',
    'Sandcastles 1770 Motel n Resort',
    'The Cats Meow',
    'Cats Meow',
    'Little Pegs Cafe', 'Alt Brew', 'The Watermark', 'The Downunder Bar',
    'Downunder Bar',
    'La Lima, comedor vegano',
    'La Pasticceria di Gracia',
    'Pasticceria',
    'La Vermu',
    'Gelatology',
    'Atabalats Gastrobar',
    'Free and Sweet',
    'La Pizza',
    'Candela Canela - Sweet Desserts',
    'Chatelet',
    'MIT K',
    'Molsa LEstel',
    'Supermercado',
    'Ecologico',
    'King Kaya',
    'VeGala Vegan Beauty',
    'Perruqueria Akash',
    'Akash',
    'Sincronia Yoga',
    'Yoga',
    'Kamoma Spritz Bar',
    'Rekup n Co Verdi',
    'Amelia Bakery - Tartas',
    'Pollo Expresss Gourmet', 'Gourmet',
    'Eco Center',
    'El Cuartito',
    'Bambule Sancho - Clothing and Asseccories',
    'Clothing and Asseccories',
    'Ecobakery Gluten Free',
    'Gluten Free',
    'Grow Cafe',
    'Deux Point Zero',
    'LLS Cafe Deli',
    'BrewDog Canary Wharf',
    'Canary Wharf',
    'Westland Coffee n Wine',
    'Nimcomsoup',
    'Sarahs Coffee, The Coffee Bean',
    'The Coffee Bean',
    'The Corner Cafe',
    'Corner Cafe',
    'Coffee Bean',
    'The Green Room',
    'Green Room',
    'Chaos Coffee Bar - Kafe Chaos',
    'Kafe Chaos',
    'Tonys coffeebar',
    'Mamas Banh - Prenzlauer Berg',
    'Prenzlauer Berg',
    'Friedel Richter Restaurant',
    'Taverna Pizza-Pinsa Romana',
    'Gostisce Pirat, Robin Vogric',
    'Pirat',
    'Robin Vogric',
    'Helado',
    'Heladeria',
    'Truck',
    'Cerveceria',
    'Dulces',
    'Tentacion',
    'Delicias',
    'Pasteles',
    'Pasteleria',
    'Panaderia', //TODO BLINK REVIEW n LOCATE BUTTON like the search button
  };
}
