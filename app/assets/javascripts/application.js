// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

function delete_todo(url,element){
if(confirm("Is this todo complete?")){
    $.ajax({
        type: "DELETE",
        url: url,
        success: function(msg){
            var current_count = $('#total_todos').text();
            var new_count = parseInt(current_count, 10) - 1;
            $('#total_todos').text(new_count);
            $(element).closest('tr').remove();
        }
    });
    }
}
