// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require moment
//= require fullcalendar

width = $(window).width();
mobile = false
if (width < 760) {
  mobile = true
}

if (mobile) {
  var date = new Date();
  date.setDate(date.getDate() - 1);
  $(function() {
    $('#calendar').fullCalendar({
      eventSources: ["/events.json"],
      defaultView: 'destiny',
      views: {
        destiny: {
          type: 'basicWeek',
          duration: { days: 4 },
        }
      },
      header: {
        left: '',
        center: '',
        right: '',
      },
      eventOrder: "order",
      height: "auto",
      themeSystem: "bootstrap4",
      defaultDate: date
    });
  })
}
else {
  var date = new Date();
  date.setDate(date.getDate() - 2);
  $(function() {
    $('#calendar').fullCalendar({
      eventSources: ["/events.json"],
      defaultView: 'destiny',
      views: {
        destiny: {
          type: 'basicWeek',
          duration: { days: 7 },
        }
      },
      header: {
        left: '',
        center: '',
        right: '',
      },
      eventOrder: "order",
      height: "auto",
      themeSystem: "bootstrap4",
      defaultDate: date
    });
  })
}