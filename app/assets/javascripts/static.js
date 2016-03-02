"use strict";
console.log("loaded");

(function(){

    var spliceLit = function(array){
        return array.splice(Math.floor(Math.random()*array.length),1)
    }

    var timePeriods = {
        "oldEnglish": ['Beowulf', 'Sir+Gawain+and+the+Green+Knight', 'inauthor:William+Langland', 'inauthor:Geoffrey+Chaucer', 'inauthor:John+Gower'],
        "renaissance": ["inauthor:Shakespeare", "inauthor:Edmund+Spencer", "inauthor:John+Milton"],
        "enlightenment": ["inauthor:benjamin+franklin", "inauthor:denis+diderot", "inauthor:rousseau", "inauthor:thomas+wyatt"],
        "romantic": ["inauthor:mary+shelley", "inauthor:william+wordworth", "inauthor:lord+byron"],
        "victorian": ["inauthor:dickens", "inauthor:bronte", "inauthor:george+meredith", "inauthor:thomas+hardy", "inauthor:oscar+wilde", "inauthor:gustave+flaubert"],
        "modernism": ["inauthor:ibanez", "inauthor:eliot", "inauthor:doolittle", "inauthor:f+scott+fitzgerald", "inauthor:william+butler+yeats", "inauthor:hemingway", "inauthor:albert+camus", "inauthor:ezra+pound", "inauthor:william+faulkner", "inauthor:virginia+woolf"],
        "postmodern": ["inauthor:henry+miller", "inauthor:burroughs", "inauthor:joseph+heller", "inauthor:kurt+vonnegut", "inauthor:thomas+pynchon", "inauthor:margaret+atwood", "inauthor:david+foster+wallace"]    
    };


    var dataArray = {
        "oldEnglish": [],
        "renaissance": [],
        "enlightenment": [],
        "romantic": [],
        "victorian": [],
        "modernism": [],
        "postmodern": []
 
    };

    $('.button').click(function(){
        var itemId = $(this).attr('id');
        console.log('clicked');

        $.ajax({
            type: "GET",
            url: "https://www.googleapis.com/books/v1/volumes?q="+spliceLit(timePeriods[itemId]),
            success: function(data){
                if(data){
                    for(i=0; i < data.items.length; i++){
                        dataArray[itemId].push(data.items[i]);
                    };// for loop
                }// if
            }// success
        })// ajax call

        var dataObj = spliceLit(dataArray[itemId]);

        var image = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/No_shield_available.svg/200px-No_shield_available.svg.png";
        var authors = "unknown"
        var title = dataObj[0].volumeInfo.title
        var link = dataObj[0].volumeInfo.previewLink;
        
        if(dataObj[0].volumeInfo.imageLinks){
            image = dataObj[0].volumeInfo.imageLinks.thumbnail;
        };
        if(dataObj[0].volumeInfo.authors){
            var authors = dataObj[0].volumeInfo.authors.join(', ');
        };
        

        $('.book-container').prepend("<div class='bookcard mdl-grid'>");
        $('.book-container').children().first().append('<div  class="img mdl-cell mdl-cell--4-col"></div>');
        $('.bookcard div:eq(0)').append('<img src='+image+'>');
        $('.book-container').children().first().append('<div  class="book-info mdl-cell mdl-cell--6-col"></div>');
        $('.bookcard div:eq(1)').append('<p id="title"><strong>Title:</strong> <u>'+ title +'</u></p>');
        $('.bookcard div:eq(1)').children().first().append('<p id="authors"><strong>Authors:</strong> '+authors+'</p>');
        $('.bookcard div:eq(1)').children().first().append('<p id="era"><strong>Literary Era:</strong> '+itemId+'</p>');
        $('.bookcard div:eq(1)').children().first().append('<p><a href="'+link+'" target="_blank">Book Preview</a></p>');
    })





})();

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    var map;
    var infowindow;

    function initMap() {
      var local = {lat: 40.740255, lng: -73.990674};

      map = new google.maps.Map(document.getElementById('map'), {
        center: local,
        zoom: 15
      });

      infowindow = new google.maps.InfoWindow();
      var service = new google.maps.places.PlacesService(map);
      service.nearbySearch({
        location: local,
        radius: 2000,
        type: ['library']
      }, callback);
    }

    function callback(results, status) {
      if (status === google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
          createMarker(results[i]);
        }
      }
    }

    function createMarker(place) {
      var placeLoc = place.geometry.location;
      var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
      });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
      });
    }