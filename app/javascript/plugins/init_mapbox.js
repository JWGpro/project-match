import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    // colour all the other users
    for (let i=0; i < markers.length - 1; i++) {
      const marker = markers[i];
      new mapboxgl.Marker({ "color": "#6959cd" })
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    }

    // colour the centre point (current user)
    const central = markers.pop();
    new mapboxgl.Marker({ "color": "#fb7f00" })
      .setLngLat([ central.lng, central.lat ])
      .addTo(map);

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
