class Attimuitehoi
  def player_win
    puts "[0]:上 [1]:右 [2]:左 [3]:下"
    attimuites = ["上","右","左","下"]

    player_arrow = gets.to_i

    program_direction = rand(4)

    if player_arrow > 3
      puts "入力された値が無効です"
      return true
    end

    puts "あなたの手:#{attimuites[player_arrow]}、プログラムの向き:#{attimuites[program_direction]}"

    if player_arrow == program_direction
      puts "あなたの勝ちです。"
    elsif (player_arrow != program_direction)
      puts "失敗です。"
      return janken
    end
  end

  def player_lose
    puts "[0]:上 [1]:右 [2]:左 [3]:下"
    attimuites = ["上","右","左","下"]
    player_direction = gets.to_i

    program_arrow = rand(4)

    if player_direction > 3
      puts "入力された値が無効です"
      return true
    end

    puts "あなたの向き:#{attimuites[player_direction]}、プログラムの手:#{attimuites[program_arrow]}"

    if (player_direction != program_arrow)
      puts "成功です。"
      return janken
    elsif player_direction == program_arrow
      puts "あなたの負けです。"
    end
  end
end

class Janken < Attimuitehoi
  def janken
    puts "じゃんけん…"
    puts "[0]:グー [1]:チョキ [2]:パー"

    player_hand = gets.to_i

    program_hand = rand(3)

    if player_hand > 2
      puts "入力された値が無効です"
      return true
    end

    case_pattern = ""

    jankens = ["グー","チョキ","パー"]

    puts "あなたの手:#{jankens[player_hand]}、プログラムの手:#{jankens[program_hand]}"

    if player_hand == program_hand
      puts "あいこです。"
      return janken
    elsif (player_hand == 0 && program_hand ==1)||(player_hand == 1 && program_hand ==2) || (player_hand == 2 && program_hand ==0)
      puts "あなたの勝ちです。あっち向いて…"
      case_pattern = "パターンA"
    else
      puts "あなたの負けです。あっち向いて…"
      case_pattern = "パターンB"
    end

    case case_pattern
    when "パターンA"
      winner = "勝ち"
      winner = Janken.new()
      # winner.extend(Attimuitehoi)
      winner.player_win()
    when "パターンB"
      loser = "負け"
      loser = Janken.new()
      # loser.extend(Attimuitehoi)
      loser.player_lose()
    end
  end
end

battle = Janken.new()
battle.janken()
