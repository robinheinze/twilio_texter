$(document).ready(function() {
    var template_h = $('#template').html();
    var pool_of_items = $('.recipient_area');


    $('.add_more').click(function(event) {
      var new_object_id = new Date().getTime() ;
      var html = template_h.replace(/index_to_replace_with_js/g, new_object_id);
      pool_of_items.append($('<p>').html(html));
      event.preventDefault();
    });

    $('.add_more_thru_ajax').click(function(event) {
      var clicked = $(this);

       if(clicked.hasClass('disabled')) {
         return false;
       }

      $.ajax({
        url: '/messages/get_recipients',
        data: {},
        method: 'get',
        beforeSend: function() {
          clicked.addClass('disabled');
        },
        success: function(data, textStatus, jqXHR) {
          var el_to_add = $('<p>').html($(data).html());
          pool_of_items.append(el_to_add);
        },
        error: function(jqXHR, textStatus, error_thrown) {
          alert('Error');
        },
        complete: function() {
          clicked.removeClass('disabled');
        }
      });
      event.preventDefault();
    });
});
