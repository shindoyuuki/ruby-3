@nokori_coin = 100
@point = 0

#コイン・ポイント
def coin_point
  puts "残りは#{@nokori_coin}枚です"
  puts "獲得ポイントは#{@point}ポイントです"
end

#コイン投入
def putin
  while true
    @num1 = rand(1..9)
    @num2 = rand(1..9)
    @num3 = rand(1..9)
    @num4 = rand(1..9)
    @num5 = rand(1..9)
    @num6 = rand(1..9)
    @num7 = rand(1..9)
    @num8 = rand(1..9)
    @num9 = rand(1..9)
    @game_coin = [5, 10, 20, "やめとく"]
    puts "何コイン入れますか？"
    puts "0(5コイン) 1(10コイン) 2(20コイン) 3(やめとく)"
    puts "---------------------"
    
    @coin = gets.to_i
    
    if @coin > 3 
      puts "0〜3のいずれかを選んでください"
      puts "-------------------------"
    elsif @coin == 3
      puts "また遊ぼう"
      exit
    elsif @nokori_coin < @game_coin[@coin] 
      puts "コインが足りません"  
    elsif @coin < 3 #空欄＝０？
      break
    end
  end
end 

#スロット開始
def slot
  puts "エンターを3回押しましょう"
  puts "---------------------"
  puts = gets
  puts "|#{@num1}| | |"
  puts "|#{@num2}| | |"
  puts "|#{@num3}| | |"
  puts "-------------"
  puts = gets
  puts "|#{@num1}|#{@num4}| |"
  puts "|#{@num2}|#{@num5}| |"
  puts "|#{@num3}|#{@num6}| |"
  puts "-------------"
  puts = gets
  puts "|#{@num1}|#{@num4}|#{@num7}|"
  puts "|#{@num2}|#{@num5}|#{@num8}|"
  puts "|#{@num3}|#{@num6}|#{@num9}|"
end

#スロット結果
def result
  if (@num1 == 7 && @num4 == 7 && @num7 == 7) ||
     (@num2 == 7 && @num5 == 7 && @num8 == 7) || 
     (@num3 == 7 && @num6 == 7 && @num9 == 7) ||
     (@num1 == 7 && @num5 == 7 && @num9 == 7) || 
     (@num3 == 7 && @num5 == 7 && @num7 == 7) 
     @nokori_coin = @nokori_coin + (100*@game_coin[@coin]) - @game_coin[@coin]
     @point += 500 # @point = @point + 500
    puts "7が揃いました。\n100コイン×賭けた枚数獲得です！\n500ポイント獲得"
    puts "--------------------"
  elsif ((@num1 == @num4) && (@num4 == @num7)) || 
        ((@num2 == @num5) && (@num5 == @num8)) || 
        ((@num3 == @num6) && (@num6 == @num9)) ||
        ((@num1 == @num5) && (@num5 == @num9)) || 
        ((@num3 == @num5) && (@num5 == @num7)) 
        @nokori_coin = @nokori_coin + (50*@game_coin[@coin]) - @game_coin[@coin]
        @point += 100
       puts "数字が揃いました。\n50コイン×賭けた枚数獲得です！\n100ポイント獲得"
       puts "--------------------"
  else
    @nokori_coin = @nokori_coin - @game_coin[@coin]
    puts "------------------"
  end
end

#コインが無くなった時の処理
def game_end
  if @nokori_coin > 0
    puts "次！"
    puts "------------------"
  elsif @nokori_coin <= 0
    puts "コインが0枚に。また遊びにきてね！"
    exit
  end
end

while true
  status = coin_point
  start = putin
  game = slot
  result_game = result
  end_game = game_end
end
  