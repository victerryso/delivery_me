$(document).ready(function () {

  var newTaskShow = function () {
    $('#task_box').empty();
    $('#new_task_form').show();
  };

  $('#new_task_button').click(newTaskShow);

//
  if ($('#my_location').text() === '') {
    display_map(-33.87, 151.21, 12);
  } else {
    var myLatitude = $('#my_latitude').text();
    var myLongitude = $('#my_longitude').text();
    display_map(myLatitude, myLongitude, 12);
  }

//

  $('#new_task').on('ajax:success', function (event, task) {
    $('#new_task').get(0).reset();
    add_marker(task.from_lat, task.from_lng, task.name)
  });

  var showTask = function () {
    var id = this.id;

    $.ajax({
      url: '/tasks/' + id,
      dataType: 'json'
    }).done(function (json) {
      $('#new_task_form').hide();
      $('#task_box').empty();

      task = json.task
      messages = json.messages

      var distance = Math.sqrt(Math.pow(task.from_lat - task.to_lat, 2) + Math.pow(task.from_lng - task.to_lng, 2)) * 100;
      var rate = Math.floor(task.price / distance);
      if (distance > 1) {
        distance = Math.floor(distance);
        distance += 'km'
      } else {
        distance *= 1000
        distance = Math.floor(distance);
        distance += 'm'
      }

      if (task.courier_id == undefined) {
        var text = "<div class='take_job' id=" + task.id + ">I can be your hero baby!</div>";
      } else {
        var text = "<div class='job_taken' id=" + task.id + ">Too late, bro!</div>";
      }

      text += '<h2>' + task.name + '</h2>'
      text += '<p><strong>Description: </strong>' + task.description + '</p>'
      text += '<p><strong>From: ' + task.from_name + '</strong><br>' + task.from_address + '</p>'
      text += '<p><strong>To: ' + task.to_name + '</strong><br>' + task.to_address + '</p>'
      text += '<p><strong>Reward:</strong> $' + task.price + '</p>'
      text += '<p><strong>Distance:</strong> ' + distance + '</p>'
      text += '<p><strong>Rate:</strong> $' + rate + '/km</p>'
      $('#task_box').append(text);

      $('.take_job').click(takeJob);

      var renderMessages = function () {

        text = '<table>';
        for (i = 0; i < messages.length; i++) {
          text += '<tr>'
          text += "<td><img class='message_icon' src='" + messages[i].user.image + "'>"
          text += "<td><p><strong>" + messages[i].user.name + '</strong><br>'
          text += messages[i].content + '</p>'
        }
        text += '</table>'

        if ($('#my_location').text() !== '') {
          text += '<form action="/messages" method="post" data-remote="true" id="create_message">'
          text += "<textarea cols='39' id='content' placeholder='Message...'></textarea>"
          text += '<button>Send</button>'
          text += '</form>'
        };

        $('#messages_box').empty();
        $('#messages_box').append(text);
      };

      renderMessages();

      $('#create_message').on('submit', function () {
        event.preventDefault();
        $.ajax({
          url: '/messages',
          type: 'POST',
          dataType: 'json',
          data: {
            task_id: id,
            content: $('#content').val()
            }
        }).done(function () {
          var $taskBox = $('.task_' + id);
          $taskBox.trigger('click');
        });
      });
    });
  };

  $('.task').click(showTask);

  var takeJob = function () {
    var taskId = $(this).attr('id');
    $.ajax({
      url: '/tasks/courier/' + taskId,
      dataType: 'json',
      method: 'put'
    }).done(function (task) {
      console.log(task);
      var text = "<div class='job_taken' id=" + task.id + ">Too late, bro!</div>"
      $('.take_job').remove();
      $('#task_box').prepend(text);
    });

  };

// My Location

  var useMyLocation = function () {
    event.preventDefault();
    var myLocation = $('#my_location').text();
    $('#task_to_name').val('Home');
    $('#task_to_address').val(myLocation);
  };

  $('#use_my_location').click(useMyLocation);

// Search Query

  var searchAddress = function () {
    event.preventDefault();
    var location = $('#my_location').text();
    var from_address = $('#search_input').val();

    var url = '/tasks/search/' + from_address
    var places;

    $.ajax({
      url: url,
      dataType: 'json',
    }).done(function (search) {
      places = search;

      $('#places_blank').text('...Results');
      $('#places_blank').val('');
      for (i = 0; i < 5; i++) {
        $('#places_' + i).text(places[i]['name'])
        $('#places_' + i).val(places[i]['vicinity'])
      };

      var autoFillOption = function () {
        var name = $('#search_results option:selected').text();
        console.log(name);
        var address = $('#search_results').val();
        $('#task_from_name').val(name);
        $('#task_from_address').val(address);
      };

      $('#search_results').on('change', autoFillOption);
    });
  };

  $('#search_button').click(searchAddress);

//

});

var mapStyle = [{"featureType":"water","stylers":[{"color":"#021019"}]},{"featureType":"landscape","stylers":[{"color":"#08304b"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0c4152"},{"lightness":5}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0b434f"},{"lightness":25}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0b3d51"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":13}]},{"featureType":"transit","stylers":[{"color":"#146474"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144b53"},{"lightness":14},{"weight":1.4}]}]

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

var add_marker = function (lat, lng, title, id) {
  var latlng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({
    animation: google.maps.Animation.BOUNCE,
    position : latlng,
    map: map,
    title: title,
    icon: 'http://png-5.findicons.com/files/icons/2252/iphone_toolbar_icons/30/icon_paper_plane.png',
    id: id
  });

  google.maps.event.addListener(marker, 'click', function() {
    map.setCenter(marker.getPosition());
    var $taskBox = $('.task_' + marker.id);
    $taskBox.trigger('click');
  });
};

