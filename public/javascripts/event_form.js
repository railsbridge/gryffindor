var EventForm = (function(){
  new Class({
    jQuery: 'event_form',
    
    initialize: function(selector) {
      this.element = $(selector);
      this.questions = this.element.find(".question_fieldset");
    },

    add_question_fields: function() {
      var attribute_number = this.questions.length;
      var new_question = $(document.create("div"));
      new_question.addClass(".question_fieldset");
      
      var new_question_text = $(document.create("input"));
      new_question_text.attr("type", "text");
      new_question_text.attr("id", "event_questions_attributes_" + attribute_number + "_question_text");
      new_question_text.attr("name", "event[questions_attributes][" + attribute_number + "][question_text]");

      new_question.append(new_question_text);
      
      var new_question_type = $(document.create("select"));
      new_question_type.attr("id", "event_questions_attributes_" + attribute_number + "_type");
      new_question_type.attr("id", "event[questions_attributes][" + attribute_number + "][type]");
      
      new_question.apped(new_question_type);
      
      new_question.insertAfter(this.questions);
    }
    
  });

  $(function(){
    $("#new_event").event_form();
  });
})();