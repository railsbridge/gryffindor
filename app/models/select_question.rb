class SelectQuestion < Question
  def options
    (self.question_text.split(":")[1]).split(",")
  end
end
