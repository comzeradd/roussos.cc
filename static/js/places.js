$(document).ready(function() {

    L.mapbox.accessToken = 'pk.eyJ1IjoiY29temVyYWRkIiwiYSI6ImxjQjFHNFUifQ.ohrYy34a8ZIZejrPSMWIww';
    var map = L.mapbox.map('map', 'comzeradd.p188j9ge', {
        attributionControl: false
    }).setView([36.01697, 1.73140], 2);
    map.addControl(L.mapbox.infoControl().addInfo('Data: <a href="http://www.openstreetmap.org/" target="_blank">OpenStreetMap</a>, Tiles: <a href="https://www.mapbox.com"target="_blank">Mapbox</a>'));

});
