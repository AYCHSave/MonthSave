// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require materialize-form
//= require Chart.bundle
//= require chartkick
//= require_tree .

$(document).on('turbolinks:load', function() {
  window.materializeForm.init();
});

$(document).on('turbolinks:load', function() {
  var calculateTotalValue = function() {
    var total = 0;

    $('.contributions-form .percentage-selector input').each(function(index, element) {
      total += parseInt($(element).val());
    });

    return total;
  };

  $('.contributions-form .percentage-selector').each(function(index, wrapper) {
    var $percentageValue = $(wrapper).find('.percentage-value');
    var $slider = $(wrapper).find('input');

    var lastValid = 0;

    $slider.on('mousemove', function() {
      if (calculateTotalValue() > 100) {
        $(this).val(lastValid);
      }

      $percentageValue.html($(this).val());
      lastValid = $(this).val();
    });
  });
});
