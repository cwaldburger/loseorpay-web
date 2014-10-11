class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def stats
  end

  def signup
    $bmi = (params[:weight].to_f/(params[:height].to_f/100*params[:height].to_f/100)).round(2)

    if $bmi < 18.5
      $answer = "You're considered underweight. You should not loose any more weight."
    elsif ($bmi >= 18.5 && 24.9 > $bmi)
      $answer = "You're considered ok."
    elsif ($bmi >= 24.9 && 30 > $bmi)
      $answer = "You're overweight"
    elsif ($bmi >= 30)
      $answer = "You're obese"
    else
      $answer = "something went wrong"
    end
      

    require 'evernote.rb'
    Everclass.createNote("Shopping List for today",  "1 Cellery, 1 Carrot, 1kg of Meat")
  end
end
