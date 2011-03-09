var EventForm = (function(){
  new Class({
    jQuery: 'event_form',
    
    initialize: function(selector) {
      this.element = $(selector);
    }
    
  });

  $(function(){
    $("#event_form").event_form();
  });
})();