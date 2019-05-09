/// the first part is what the users see
/// the second part is the filename to load
/// the third part is the type of suggestion (continent,state,city)

class Suggestions {
  static final locations = const {
    //TODO add continents to search for, then show full list without filter when selected a continent
    //TODO update new locations which are in placesId, remove old locations, use these new locations as single source of truth, remove them from places.json, use numbers like with the tags
    'Germany - Europe,e,s',
    'Berlin - Germany - Europe,e,ci',
    'Spain - Europe,e-spa,s',
    'Barcelona - Spain - Europe,e-spa,ci',
    'Benidorm - Spain - Europe,e-spa,ci',
    'Tarifa - Spain - Europe,e-spa,ci',
    'France - Europe,e,s',
    'Paris - France - Europe,e,ci',
    'UK - Europe,e,ci',
    'England - Europe,e,ci',
    'London - England - Europe,e,ci',
    'Holywell - England - Europe,e,ci',
    'Rhos on Sea - England - Europe,e,ci',
    'Brackley - England - Europe,e,ci',
    'Norway - Europe,e,s',
    'Bergen - Norway - Europe,e,ci',
    'Sweden - Europe,e,s',
    'Gothenburg - Sweden - Europe,e,ci',
    'Rychnov nad Kněžnou - Czechia - Europe,e,ci',
    'Czechia - Europe,e,s',
    'Piran - Slovenia - Europe,e,ci',
    'Slovenia - Europe,e,s',
    'Yerevan - Armenia - Europe,e,ci',
    'Armenia - Europe,e,s',
    'Yaroslavl - Europe,e,ci',
    //'America,am,co',
    'Venezuela - America,am-ven,s',
    'Caracas - Venezuela - America,am-ven-car,ci',
    'Portuguesa - Venezuela - America,am-ven-car,ci',
    'Araure - Venezuela - America,am-ven-car,ci',
    'Aragua - Venezuela - America,am-ven-car,ci',
    'Choroni - Venezuela - America,am-ven-car,ci',
    'Lecheria - Venezuela - America,am-ven-car,ci',
    'Zulia - Venezuela - America,am-ven-car,ci',
    'Maracaibo - Venezuela - America,am-ven,ci',
    'Anzoategui - Venezuela - America,am-ven,ci',
    //'Alto Mar - Venezuela - America,am-ven,ci',
    'Puerto la Cruz - Venezuela - America,am-ven,ci',
    'Vargas - Venezuela - America,am-ven,ci',
    'Catia La Mar - Venezuela - America,am-ven,ci',
    'El Parmazo - Venezuela - America,am-ven,ci',
    'Acarigua - Venezuela - America,am-ven,ci',
    'San Cristobal - Venezuela - America,am-ven,ci',
    'Tachira - Venezuela - America,am-ven,ci',
    'Columbia - America,am,s',
    'Popayán - Colombia,am,ci',
    'Belize - America,am,s',
    'Hopkins - Belize - America,am,ci',
    'Unitedville - Belize - America,am,ci',
    'Mexico - America,am,s',
    'Tabasco - Mexico - America,am,ci',
    'Villahermosa - Mexico - America,am,ci',
    'Dominican Republic - America,am,s',
    'Santo Domingo - Dom. Rep. - America,am,ci',
    'Canada - America,am,s',
    'NB - Canada - America,am,s',
    'Saint Stephen - Canada - America,am,ci',
    'Toronto - Canada - America,am,ci',
    'NH - New Hampshire - America,am,s',
    'New Hampshire - America,am,s',
    'Alstead - New Hampshire - America,am,ci',
    'Portsmouth - New Hampshire - America,am,ci',
    'Virginia - America,am,s',
    'Norfolk - Virginia - America,am,ci',
    'New York - America,am,s',
    'NYC - New York - America,am,ci',
    'USA - America,am,s',
    'WY - Wyoming - America,am,ci',
    //'California - America,am,s',
    //'San Jose - California - America,am,ci',
    'LA - Los Angeles - California - America,am,ci',
    'FL - Florida - America,am,s',
    'Orlando - Florida - America,am,ci',
    'Wisconsin - America,am,s',
    'Madison - Wisconsin - America,am,ci',
    'Milwaukee - Wisconsin - America,am,ci',
    //'Wyoming - America,am,s',
    'Sheridan - Wyoming - America,am,ci',
    'Utah - America,am,s',
    'Salt Lake City - Utah - America,am,ci',
    'Indonesia - Asia,as,s',
    'Bali - Indonesia - Asia,as,ci',
    'Singapore - Malaysia - Asia,as,ci',
    'Philippines - Asia,as,s',
    'Manila - Philippines - Asia,as,ci',
    'Thailand - Asia,as,s',
    'Pattaya - Thailand - Asia,as,ci',
    'Bangkok - Thailand - Asia,as,ci',
    'Chiang May - Thailand - Asia,as,ci',
    'Japan - Asia,as-jap,s',
    'Suginami City - Tokyo - Japan,as-jap,ci',
    'Shibuja City - Tokyo - Japan,as-jap,ci',
    'Meguro City - Tokyo - Japan,as-jap,ci',
    'Kanasugi - Japan,as-jap,ci',
    'Matsubushi - Japan,as-jap,ci',
    'Saitama - Japan,as-jap,ci',
    'Yuigahama - Japan,as-jap,ci',
    'Chiyoda City - Japan,as-jap,ci',
    'Osaka - Japan,as-jap,ci',
    'Sakai - Japan,as-jap,ci',
    'Naka Ward - Japan,as-jap,ci',
    'Fukaishimizucho,as-jap,ci',
    'Marunouchi - Japan,as-jap,ci',
    'Maruyamacho - Japan,as-jap,ci',
    'Kamakura - Japan,as-jap,ci',
    'Kanagawa - Japan,as-jap,ci',
    'Azabujuban - Japan,as-jap,ci',
    'Shinjuku City - Tokyo - Japan,as-jap,ci',
    'Chuo City - Tokyo - Japan,as-jap,ci',
    'Kamiuma - Tokyo - Japan,as-jap,ci',
    'Setagaya City - Tokyo - Japan,as-jap,ci',
    'Tokyo - Japan - Asia,as-jap,ci', 'Minato City - Tokyo - Japan,as-jap,ci',
    'Roppongi - Tokyo - Japan,as-jap,ci',
    'Ebisunishi - Tokyo - Japan,as-jap,ci',
    'Ginza - Tokyo - Japan,as-jap,ci',
    'Shibuya City - Tokyo - Japan,as-jap,ci',
    'Osaka - Japan - Asia,as-jap,ci',
    'Fukuoka - Japan - Asia,as-jap,ci',
    'Nagasaki - Japan - Asia,as-jap,ci',
    'Samoa - America,am,s',
    'Apia - Samoa - America,am,ci',
    'Russia - Asia,as,s',
    'Australia,au,co',
    'WA - West Australia - Australia,au,s',
    'NSW - New South Wales - Australia,au,s',
    'VIC - Victoria - Australia,au,s',
    'QLD - Queensland - Australia,au,s',
    'Melbourne - Victoria - Australia,au,ci',
    'Sidney - New South Wales - Australia,au,ci',
    'Nelson Bay - New South Wales - Australia,au,ci',
    'Byron Bay - New South Wales - Australia,au,ci',
    'Queensland - Australia,au,s',
    'Gold Coast - Queensland - Australia,au,ci',
    'Brisbane - Queensland - Australia,au,ci',
    'Agnes Water - Queensland - Australia,au,ci',
    'Aitkenvale - Queensland - Australia,au,ci',
    'Townsville - Queensland - Australia,au,ci',
    'Elwood - Victoria - Australia,au,s',
    'Cairns - Queensland - Australia,au,ci',
    'Perth - West Australia - Australia,au,ci',
    'Christchurch - New Zealand,au,ci'
  };
}
