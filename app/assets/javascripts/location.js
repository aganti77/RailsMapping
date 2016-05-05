var map = L.map( 'map', {
    center: [39.952584, -75.165222],
    minZoom: 2,
    zoom: 15
});

L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
    subdomains: ['otile1','otile2','otile3','otile4']
}).addTo(map);

var myURL = jQuery('script[src$="location.js"]').attr('src').replace('location.js', '');
 
var myIcon = L.icon({
    iconUrl: myURL + 'pin24.png',
    iconRetinaUrl: myURL + 'pin48.png',
    iconSize: [29, 24],
    iconAnchor: [9, 21],
    popupAnchor: [0, -14]
});

var markerClusters = L.markerClusterGroup();

for(var i=0; i<gon.address.length; i++) {
	var address = gon.address[i];
	var popup = "<b>Address:</b> " + address + "<br>" +
			"<b>Permit ID:</b> " + gon.permitID[i] + "<br>" +
			"<b>Type Code:</b> " + gon.typeCode[i] + "<br>" +
			"<b>Type Name:</b> " + gon.typeName[i] + "<br>" +
			"<b>Application Description:</b> " + gon.appDes[i] + "<br>" +
			"<b>Date Issued:</b> " + gon.dateIssued[i] + "<br>" +
			"<b>Status:</b> " + gon.status[i] + "<br>" +
			"<b>Contractor Name:</b> " + gon.conName[i] + "<br>" +
			"<b>Contractor Address One:</b> " + gon.conAddr1[i] + "<br>" +
			"<b>Contractor City:</b> " + gon.city[i] + "<br>" +
			"<b>Contractor State:</b> " + gon.state[i] + "<br>" +
			"<b>Contractor Zip:</b> " + gon.zip[i];
	var m = L.marker([gon.lat[i], gon.long[i]], {icon: myIcon}).bindPopup(popup);
	markerClusters.addLayer(m);
}

var tempMapData = gon.tempMapData;

if (typeof tempMapData !== 'undefined') {
	for(var i = 0; i<tempMapData.length; i++) {
		var point = tempMapData[i]
		var popup = "<b>Address:</b> " + point[0] + "<br>" +
			"<b>Permit ID:</b> " + point[1] + "<br>" +
			"<b>Type Code:</b> " + point[2] + "<br>" +
			"<b>Type Name:</b> " + point[3] + "<br>" +
			"<b>Application Description:</b> " + point[4] + "<br>" +
			"<b>Date Issued:</b> " + point[5] + "<br>" +
			"<b>Status:</b> " + point[6] + "<br>" +
			"<b>Contractor Name:</b> " + point[7] + "<br>" +
			"<b>Contractor Address One:</b> " + point[8] + "<br>" +
			"<b>Contractor City:</b> " + point[9] + "<br>" +
			"<b>Contractor State:</b> " + point[10] + "<br>" +
			"<b>Contractor Zip:</b> " + point[11] + "<br>";
		var m = L.marker([point[12], point[13]], {icon: myIcon}).bindPopup(popup);
		markerClusters.addLayer(m);
	}
}

map.addLayer(markerClusters);