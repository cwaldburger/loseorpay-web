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
      $answerTitle = "You're considered underweight.";
      $answer = "You should not loose any more weight. Treat yourself to that chocolate cake or Burger you've been looking forward to devouring! :)"
      $carlOp = "Carl thinks you should eat more!"
    elsif ($bmi >= 18.5 && 24.9 > $bmi)
      $answerTitle = "Hey there! You're in the zone - your BMI is just right."
      $answer = "Make sure you don't drop below 18.5 by still signing up and profiting from our delicious recipe recommendations!"
      $carlOp = "You made Carl happy"
    elsif ($bmi >= 24.9 && 30 > $bmi)
      $answerTitle = "Time to talk Buddy! You weigh more than you should."
      $answer = "Sign up and we'll help you reach a healthier Body Mass Index by tracking your progress and sending you delicious menu and recipe recommendations! Did you know that just starting to track your weight will have a positive effect on your weight? If you're intereted in the science behind this, head over to Tim Ferris' <a href=\"http://fourhourbody.com/\" target=\"_blank\">website</a>. Don't forget to set your weekly wager below and start improving your Health help today!"
      $carlOp = "Carl's not quite satisfied. Way to go!"
    elsif ($bmi >= 30)
      $answerTitle = "It may look like an endless road to get to a healthier BMI but we're here to help you along the way!"
      $answer =  "Sign up and we'll help you reach a healthier Body Mass Index by tracking your progress and sending you delicious menu and recipe recommendations! Did you know that just starting to track your weight will have a positive effect on your weight? If you're intereted in the science behind this, head over to Tim Ferris' <a href=\"http://fourhourbody.com/\" target=\"_blank\">website</a>. Don't forget to set your weekly wager below and start improving your Health today!"
      $carlOp = "Carl's worried. Time to change this!"
    else
      $answerTitle = "Please provide us with your Weight and Height"
      $answer = "Please provide us with your Weight and Height"
    end
      

    require 'evernote.rb'
    Everclass.createNote("Shopping List for today",  "1 Cellery, 1 Carrot, 1kg of Meat")

  end
end
