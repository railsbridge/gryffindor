class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :event

  validates_presence_of :question_text

  def form_type
    self.class.to_s.underscore.slice(/(.)+(?=_question)/)
  end

  def options
    self.question_text.split(":")[1].to_s.split(",").collect! do |x|
      x.strip!
    end
  end

 class << self
    def new_with_cast(*a, &b)
      if (h = a.first).is_a? Hash and (type = h[:type] || h['type']) and (klass = type.constantize) != self
        raise "Unknown decendant type"  unless klass < self 
        return klass.new(*a, &b)
      end

      new_without_cast(*a, &b)
    end
    alias_method_chain :new, :cast
  end

end
