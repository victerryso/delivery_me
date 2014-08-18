$(document).ready(function () {

  var newTaskShow = function () {
    $('#new_task_form').show();
  };

  $('#new_task_button').click(newTaskShow);

//

  display_map(-33.87, 151.21, 12);

//

  $('#new_task').on('ajax:success', function (event, task) {
    $('#new_task').get(0).reset();
    console.log(task.name);
    add_marker(task.from_lat, task.from_lng, task.name)
  });

  $('.task').click(function () {
    var id = this.id;

    $.ajax({
      url: '/tasks/' + id,
      dataType: 'json'
    }).done(function (task) {
      $('#new_task_form').hide();
      $('#task_box').empty();
      var text = '<h2>' + task.name + '</h2>'
      text += '<p><strong>Description: <strong>' + task.description + '</p>'
      text += '<h3>$' + task.price + '</h3>'
      text += task.from_address
      text += "<button id='new_task_button'>New Task</button>"
      $('#task_box').append(text)
    });
  });




});

var mapStyle = [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]},{"featureType":"landscape","stylers":[{"color":"#f2e5d4"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}]

var map;

var display_map = function (lat, lng, zoom) {

  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: mapStyle
  };

  var canvas = $('#map_canvas').get(0);

  map = new google.maps.Map(canvas, mapOptions);

};

var add_marker = function (lat, lng, title) {
  var latlng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({
    animation: google.maps.Animation.DROP,
    position : latlng,
    map: map,
    title: title
  });
};

