var EventForm = (function(){
  new Class({
    jQuery: 'event_form',
    
    initialize: function(selector) {
      this.element = $(selector);
    }
    
  });

  $(function(){
    $("#new_event").event_form();
  });
})();