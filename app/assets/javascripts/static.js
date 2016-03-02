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
        "modernism": ["inauthor:ibanez", "inauthor:eliot", "inauthor:doolittle", "inauthor:fitzgerald", "inauthor:william+butler+yeats", "inauthor:hemingway", "inauthor:albert+camus", "inauthor:ezra+pound", "inauthor:faulkner", "inauthor:virginia+woolf"],
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

            var image = "https://i.ytimg.com/vi/rg-3a6Hy-yc/maxresdefault.jpg";
            var authors = "unknown"
            var title = dataObj[0].volumeInfo.title
            var link = dataObj[0].volumeInfo.previewLink;
            
            if(dataObj[0].volumeInfo.imageLinks){
                image = dataObj[0].volumeInfo.imageLinks.thumbnail;
            };
            if(dataObj[0].volumeInfo.authors){
                var authors = dataObj[0].volumeInfo.authors.join(', ');
            };
            

            $('.twelve').prepend("<div class='bookcard'>");
            $('.twelve').children().first().append('<img src='+image+'>');
            $('.twelve').children().first().append('<p id="title">'+ title +'</p>');
            $('.twelve').children().first().append('<p id="authors">'+authors+'</p>');
            $('.twelve').children().first().append('<p><a href="'+link+'">LINK</a></p>');
        })


    // $('#old').click(function(){
    //     console.log("clicked");

    //     $.ajax({
    //         type: "GET",
    //         url: "https://www.googleapis.com/books/v1/volumes?q="+spliceLit(timePeriods.oldEnglish),
    //         success: function(data){
    //             if(data){
    //                 for(i=0; i < data.items.length; i++){
    //                     dataArray.oldEnglish.push(data.items[i]);
    //                 };// for loop
    //             }// if
    //         }// success
    //     })// ajax call

    //     var dataObj = spliceLit(dataArray.oldEnglish);

    //     var image = "https://i.ytimg.com/vi/rg-3a6Hy-yc/maxresdefault.jpg";
    //     var authors = "unknown"
    //     var title = dataObj[0].volumeInfo.title
    //     var link = dataObj[0].volumeInfo.previewLink;
        
    //     if(dataObj[0].volumeInfo.imageLinks){
    //         image = dataObj[0].volumeInfo.imageLinks.thumbnail;
    //     };
    //     if(dataObj[0].volumeInfo.authors){
    //         var authors = dataObj[0].volumeInfo.authors.join(', ');
    //     };
        

    //     $('.twelve').prepend("<div class='bookcard'>");
    //     $('.twelve').children().first().append('<img src='+image+'>');
    //     $('.twelve').children().first().append('<p id="title">'+ title +'</p>');
    //     $('.twelve').children().first().append('<p id="authors">'+authors+'</p>');
    //     $('.twelve').children().first().append('<p><a href="'+link+'">LINK</a></p>');
    // })// #old click


})();