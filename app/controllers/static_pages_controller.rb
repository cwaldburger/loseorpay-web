class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def stats

    # if params[:process_image] == 1 
      require 'evernote.rb'
      token = "S=s1:U=8fa5f:E=150563fe2fb:C=148fe8eb370:P=1cd:A=en-devtoken:V=2:H=a2c06cdfa2821731b951198d4e366a01"

      userStore = Everclass.connectWithDevToken
      notebook, noteStore = Everclass.returnNotebook(userStore,"WeightLogs")

      noteFilter = Evernote::EDAM::NoteStore::NoteFilter.new 
      noteFilter.notebookGuid = notebook.guid
      result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new(includeUpdated: true)

      noteList    = noteStore.findNotesMetadata(token, noteFilter,0 , 40000, result_spec)

      noteList.notes.sort! { |a,b| a.updated <=> b.updated }
      current_note_guid = noteList.notes.last.guid
      currentNote = noteStore.getNote(token, current_note_guid, false, false, false, false); nil

      current_resource_guid = currentNote.resources.first.guid

    #   current_resource = noteStore.getResource(token, current_resource_guid, true, true, true, true); nil

    #   file_content = current_resource.data.body; nil
    #   file_type = current_resource.mime; nil
    #   file_name = current_resource.attributes.fileName
    # end

    user_info = userStore.getPublicUserInfo("wasilenko")
    res_guid = current_resource_guid
    $res_url = "#{user_info.webApiUrlPrefix}/res/#{res_guid}"

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
    Everclass.createNote("Shopping list for the week:",  "5 apples

5 oranges

500 gr chicken breast

500 gr beef

1 bag of quinoa

1 bag of rice

5 tomatoes

2 cucumbers

2 garlic cloves

4 onions

200 gr of almonds

200 gr of Brazilian nuts

5 plain yogurts

6 eggs")

    Everclass.createNote("Fisher’s fishy fish menu",  "Instructions:

Go to Canada

Catch a salmon

Or go to LeShop.com and get a salmon in skin


Additionally get:

1 Lemon

1 Garlic clove

1 Ginger head

100 ml of Olive Oil


Cook it:


Shred ginger and garlic

Mix in olive oil

Squeeze lemon into the mixture

Rub the salmon with the mixture

Put it into the oven for 20 min at 250 degrees

Enjoy for dinner with some fresh salad")

    Everclass.createNote("Quinoa salad delight",  "Instructions:

Buy a quinoa plantation in Latin America

Plant seeds

Wait 3 months

Harvest

Or go to LeShop.com and get a bag of quinoa


Additionally get:

1 Lemon

3 Tomatoes

1 Onion

100 ml of Olive Oil


Cook it:

Cook 100 grams of quinoa, let it cool down a bit

Cut and mix tomatoes and onion in small pieces

Squeeze some lemon over the mixture

Mix quinoa, vegetables and olive oil


And there is your healthy lunch!")

  end



end
