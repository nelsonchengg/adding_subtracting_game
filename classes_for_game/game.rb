class Game

  def initialize()
    @player_count = 0
    @turn_count = 0
    @current_player = nil
  end

  def start_game

    while @player_count < 2 do
    puts "Enter your name"
    print "> "
    name = $stdin.gets.chomp

    if @player_count == 0
      @p1 = Player.new(name)
    end

    if @player_count == 1
      @p2 = Player.new(name)
    end

    @player_count += 1
    end

    @current_player = @p1

    game_loop
  end

  def game_loop

    while @turn_count < 10 && @p1.lives > 0 && @p2.lives > 0 do
      q = Question.new
      q.question(@current_player.name)
      print "> "
      answer = $stdin.gets.chomp.to_i

      if answer != q.answer
        puts "Wrong you clown!"
        @current_player.lives = @current_player.lives - 1
      end
      
      if answer == q.answer
        puts "I'm surprised you got it right you circus clown!"
      end
      puts "LIVES REMAINING #{@p1.name}: #{@p1.lives} lives left || #{@p2.name}: #{@p2.lives} lives left"

      @turn_count += 1
      
      if @current_player == @p1
        @current_player = @p2
      elsif @current_player == @p2
        @current_player = @p1
      end

    end

    if @p1.lives > @p2.lives
      puts "Game Over, #{@p1.name} Wins!"
    end

    if @p1.lives < @p2.lives
      puts "Game Over, #{@p2.name} Wins!"
    end

    if @p1.lives == @p2.lives
      puts "Game Over, I guess you'll have to fight to the death to find out who is greater..."
    end

  end

end