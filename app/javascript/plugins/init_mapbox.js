import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 100, maxZoom: 5000, duration: 0 });
};

const initMapbox = () => {
  const maps = document.querySelectorAll('.map');
  let counter = 0;
  maps.forEach((mapElement) => {
    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: `map_${counter}`,
        style: 'mapbox://styles/mapbox/streets-v10'
      });

      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {

  // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('https://res.cloudinary.com/kloomes/image/upload/${marker.cl_image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.transition = "all .75s ease"
      element.style.width = '50px';
      element.style.height = '50px';
      element.style.borderRadius = '50%';


// element.addEventListner

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      });

      // colour the centre point (current user)
      const central = markers.pop();
      new mapboxgl.Marker({ "color": "#fb7f00" })
        .setLngLat([ central.lng, central.lat ])
        .addTo(map);

      fitMapToMarkers(map, JSON.parse(mapElement.dataset.markers));
      counter += 1;
    }
  })


};

export { initMapbox };
