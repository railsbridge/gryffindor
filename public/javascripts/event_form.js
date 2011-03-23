var EventForm = (function(){
  new Class({
    jQuery: 'event_form',
    
    initialize: function(selector) {
      this.element = $(selector);
      this.refresh_questions();
      this.add_question_link = this.element.find("#add_question");

      this.add_question_link.click(function(){
        this.add_question_fields();
        // return false;
      }.bind(this));
    },

    refresh_questions: function() {
      this.questions = this.element.find(".question_fieldset");
    },

    add_question_fields: function() {
      var attribute_number = this.questions.length;
      var new_question = $(document.createElement("div"));
      new_question.addClass("question_fieldset");
      
      var new_question_text = $(document.createElement("input"));
      new_question_text.attr("type", "text");
      new_question_text.attr("id", "event_questions_attributes_" + attribute_number + "_question_text");
      new_question_text.attr("name", "event[questions_attributes][" + attribute_number + "][question_text]");

      new_question.append(new_question_text);

      var new_question_type_wrapper = $(document.createElement("li"));
      new_question_type_wrapper.addClass("select optional");
      new_question_type_wrapper.attr("id", "event_questions_attributes_" + attribute_number + "_type_input");
      
      var new_question_type = $(document.createElement("select"));
      new_question_type.attr("id", "event_questions_attributes_" + attribute_number + "_type");
      new_question_type.attr("name", "event[questions_attributes][" + attribute_number + "][type]");

      var type_options = ["", "TextQuestion", "SelectQuestion", "RadioQuestion", "CheckBoxesQuestion"]
      for(var i = 0; i < type_options.length; i++) {
        var option = $(document.createElement("option"));
        option.val(type_options[i]);
        option.text(type_options[i]);
        new_question_type.append(option);
      }
      
      new_question_type_wrapper.append(new_question_type);
      new_question.append(new_question_type_wrapper);      
      new_question.insertAfter(this.questions.last());
      this.refresh_questions();
    }
    
  });

  $(function(){
    $("#new_event").event_form();
  });
})();