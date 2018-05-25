class Optellen
  def do getal1, getal2
    puts @resultaat = getal1 + getal2
  end

  def even?
    return puts "Geen resultaat beschikbaar!" unless @resultaat
    if @resultaat % 2 == 0 
      puts "Ja!"
    else 
      puts "Nee!"
    end
  end
end

optellen = Optellen.new
optellen.even? # Geen resultaat beschikbaar!
optellen.do 2, 2 # 4
optellen.even? # Ja!
optellen.do 3, 6 # 9
optellen.even? # Nee!
