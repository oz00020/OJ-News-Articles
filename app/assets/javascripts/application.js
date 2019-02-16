// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

{
  "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
  "body": [
    {
      "type": "heading",
      "model": {
        "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      }
    },
    {
      "type": "paragraph",
      "model": {
        "text": "Etiam ornare nulla in sem pharetra, vel varius magna tempus. Praesent pulvinar eget dolor vitae elementum. Donec id velit at sem gravida tristique non vitae lorem."
      }
    },
    {
      "type": "image",
      "model": {
        "url": "https://picsum.photos/640/420/?random",
        "altText": "Vestibulum pellentesque laoreet urna, eget dignissim lorem maximus vel",
        "height": "420",
        "width": "640"
      }
    },
    {
      "type": "paragraph",
      "model": {
        "text": "Nulla tortor nunc, posuere eu purus eget, ultricies ullamcorper sapien. Duis viverra lectus eget dolor gravida rhoncus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce molestie, odio at mattis auctor, mauris lectus luctus risus, eget pulvinar tortor erat a est."
      }
    },
    {
      "type": "paragraph",
      "model": {
        "text": "Mauris accumsan maximus enim, eleifend consectetur turpis molestie malesuada. Proin vulputate dui non mattis venenatis. Nam ornare sapien eget nibh placerat, faucibus dapibus lacus consectetur."
      }
    },
    {
      "type": "list",
      "model": {
        "type": "unordered",
        "items": [
          "Vestibulum viverra viverra ullamcorper",
          "Aenean ut felis hendrerit, scelerisque est sed, rhoncus sem"
        ]
      }
    }
  ]
}
