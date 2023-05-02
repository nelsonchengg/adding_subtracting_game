class Question

  def initialize()
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @operation = ["+", "-"]
    @index = rand(2)
  end

  def question(current_player)
    puts "#{current_player}: What does #{@first_num} #{@operation[@index]} #{@second_num} equal?"
  end

  def answer
    eval "#{@first_num} #{@operation[@index]} #{@second_num}"
  end

end