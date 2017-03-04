use Term::ANSIColor; #Added for colored text.
$userName = "User"; #This variable stores the name of the user. It is also used on the terminal.
$randCount = 0; #This is a variale used to randomize the answers
@inputArchive = (); #This array is used to archive all the input from the user to avoid repetition

#This hash is used to convert pronouns to ask questions
my %pronounConvert  = (i => 'this',
                    he => 'him',
                    she => 'her',
                    it => 'it',
                    they => 'them');
#This hash conjugate the verb 'to Do'
my %conjugateDo  = (i => 'do',
                    he => 'does',
                    she => 'does',
                    it => 'does',
                    you => 'do',
                    we => 'do',
                    they => 'do');

#This hash conjugate the auxiliary 'to be'
my %conjugateBe  = (i => 'are',
                    he => 'is',
                    she => 'is',
                    it => 'is',
                    you => 'are',
                    we => 'are',
                    they => 'are');

#This hash converts the pronouns for questions
my %pronounForQuestions = (i => 'you',
                          he => 'he',
                          she => 'she',
                          it => 'it',
                          you => 'me',
                          we => 'we',
                          they => 'they');

#Printing a NOTE about how to quit the program
print colored(['white on_black'],"NOTE: If you don't feel good at any moment just say \"quit\", and we will schedule another meeting\n\n");
$quit = 1; #The quit variable

#Startug the conversation by asking the user's name
$response="Hello, my name is Eliza, what's yours?";
printTerminal();

getName(input()); #  start by getting the name of the User

#The start of our main loop
while($quit){
  $input = input(); #  get the output using the input function
  $input = lc($input); # convert to lowercase
  chomp $input; # Remove the new line character

  # the Quit condition
  if($input eq "quit"){
    $quit = 0;
    $response = "Goodbye ".$userName.", see you soon! \n ALWAYS REMEMBER: The only disability in life is a bad attitude.";
    printTerminal();
  }

  #Checking for repetition
  elsif (@inputArchives[-2] eq @inputArchives[-1]){
    $response = "Please do not repeat yourself!";
    printTerminal();
  }

  # When the user is talking about something using 'MY' or 'IT', or talking about someone using 'HE' or 'SHE'
  elsif($input =~ /\bmy\b/ | $input =~ s/^([A-Za-z\,\?\!\']+\s)+(\bhe\b)/he/ | $input =~ s/^([A-Za-z\,\?\!\']+\s)+(\bshe\b)/she/ | $input =~  s/^([A-Za-z\,\?\!\']+\s)+(\bit\b)/it/ ){
    if($& eq "my"){
      if ($randCount % 2 == 0) {
        $response = "Tell me more about your".$'.".";
        printTerminal();
      }
      else {
        $response = "What is you tell me about your".$'.".";
        printTerminal();
      }
    }
    else{
      if ($randCount % 2 == 1) {
        $response = "Tell me more about ".$pronounConvert{$2}.".";
        printTerminal();
      }
      else{
        $response = "How do you feel toward ".$pronounConvert{$2}.".";
        printTerminal();
      }

    }
    $randCount++;

  }

  #Trying to catch when the user is trying to make an argument
  elsif($input =~ /\b(because|since)\b/) {
    if ($randCount % 2 == 1) {
      $response = "Are you sure that's the only reason?";
      printTerminal();
    } else {
      $response = "You mean, there is no other reasons?";
      printTerminal();
    }
    $randCount++;
  }
  #Catching feelings and emotions
  # I got the list of feelings and emotions from http://wire.wisc.edu/quizzesnmore/emotionwords.aspx
  elsif($input =~ s/\b(joyful|bad|happy|tenderness|helpless|defeated|rageful|cheerful|sympathy|powerless|bored|outraged|content|adoration|dreading|rejected|hostile|proud|fondness|distrusting|disillusioned|bitter|satisfied|receptive|suspicious|inferior|hateful|excited|interested|cautious|confused|scornful|amused|delighted|disturbed|spiteful|elated|shocked|overwhelmed|helpless|vengeful|enthusiastic|exhilarated|uncomfortable|isolated|disliked|optimistic|dismayed|guilty|numb|resentful|elated|amazed|hurt|regretful|trusting|delighted|confused|lonely|ambivalent|alienated|calm|stunned|melancholy|exhausted|bitter|relaxed|interested|depressed|insecure|insulted|relieved|intrigued|hopeless|disgusted|indifferent|hopeful|absorbed|sad|pity)\b/$1/){
    if ($randCount % 2 == 0) {
      $response = "Ohh! why are you feeling ".$1."?";
      printTerminal();
    } else {
      $response = "I am glad you are sharing your thoughts. Can you tell me why do you feel ".$1."?";
      printTerminal();
    }
    $randCount++;
  }

  # Responding to the question 'Who are you?'
  elsif($input =~ /\bwho\b\s\bare\b\s\byou/){
    $response = "I am Eliza, your psychiatric!";
    printTerminal();
  }

  #Checking when the user is addressing tio Eliza
  elsif ($input =~ /\byou\b/) {
    $response = "Now we are talking about you! Tell me what's in your mind!";
    printTerminal();
  }

  # Catching questions
  elsif($input =~ /^\b(why|when|where|what|who)\b/){
    if ($randCount % 3 == 0) {
      $response = "What do you think is the answer for that?";
      printTerminal();
    } elsif ($randCount % 3 == 2){
      $response = "I have always been much better at asking questions than knowing what the answers were.";
      printTerminal();
    }
    else{
      $response = "The only interesting answers are those that destroy the questions.";
      printTerminal();
    }
    $randCount++;
  }

  # Catching when the user is being negative
  elsif($input =~ /^\byou\b\s\bcan\'t\b/) {
    $response = "You are maybe right, but let's try?";
    printTerminal();
  }

  # Catching when the user is being confused
  elsif($input =~ /(\bi\b\s\bdon\'t\b\s\bknow\b)/) {
    if ($randCount % 2 == 1) {
      $response = $userName.", I am here for you! Tell me what's wrong?";
      printTerminal();
    } else {
      $response = "It's fine, just tell me how do you feel!";
      printTerminal();
    }
    $randCount++;
  }

  # Catching when the user needs something
  elsif($input =~ /(\bi\b)\s(\bneed\b)/) {
    $response = "All you need is love. But a little chocolate now and then doesn\'t hurt.";
    printTerminal();
  }
  elsif($input =~ /^\bi\b\s\adon\'t\b\s\bknow\b/) {

  }
  #Converting statments that start with a pronoun to a question (dealing with 'I, HE, SHE and THEY')
  elsif($input =~ s/^(\bi\b)\s\bam\b\s(([A-Za-z\,\?\!\']+\s?)+)/$3/ | $input =~ s/^(\bhe\b)\s\bis\b\s(([A-Za-z\,\?\!\']+\s?)+)/$3/ |
        $input =~ s/^(\bshe\b)\s\bis\b\s(([A-Za-z\,\?\!\']+\s?)+)/$3/ |
        $input =~ s/^(\bit\b)\s\bis\b\s(([A-Za-z\,\?\!\']+\s?)+)/$3/ |
        $input =~ s/^(\bthey\b)\s\bare\b\s(([A-Za-z\,\?\!\']+\s?)+)/$3/
        ){
          $response = "Why ".$conjugateBe{$1}." ".$pronounForQuestions{$1}." ".$2."?";
          printTerminal();
  }

  #Converting statments that start with a pronoun to a question (dealing with 'I, HE, SHE and THEY')
  elsif($input =~ s/(^\bi\b)\s(([A-Za-z\,\?\!\']+\s?)+)/$2/ | $input =~ s/^(\bhe\b)\s(([A-Za-z\,\?\!\']+\s?)+)/$2/ |
        $input =~ s/^(\bshe\b)\s(([A-Za-z\,\?\!\']+\s?)+)/$2/ |
        $input =~ s/^(\bit\b)\s(([A-Za-z\,\?\!\']+\s?)+)/$2/ |
        $input =~ s/^(\bthey\b)\s(([A-Za-z\,\?\!\']+\s?)+)/$2/
        ){
        $response = "Why ".$conjugateDo{$1}." ".$pronounForQuestions{$1}." ".$2."?";
        printTerminal();
  }

  # Responding to anything else
  else{
    if ($randCount % 3 == 0) {
      $response = $userName.", sometimes it's hard to express our feelings and ideas, could say it again?";
      printTerminal();
    } elsif ($randCount % 3 == 1) {
      $response = $userName.", could you say it in other words?";
      printTerminal();
    } else {
      $response = "Could you be more precise!";
      printTerminal();
    }
    $randCount++;
  }
}

# input() is a function that takes an input from the user
sub input{
  print "$userName> "; # Prompting the user with his name
  $input = <STDIN>;
  chomp($input);
  push(@inputArchives, $input); # Push the new input to the array of inputs
  return $input;
}

# The getName() function is used to get the name of the User
sub getName($input){
  $input = lc($input); #Convert the input to lowercase
  if ($input =~ /([A-Za-z\,\?\!\'\^]*\s)*(my name is|i am|i'm)?\s?(\b\w+\b)/) #The s// is for substitution
  {
    $userName = ucfirst($3); # Uppercase the first letter of the name and lowercase the rest
    $response = "Nice to meet you ".$userName.", How can I help you?";
    printTerminal();
  }
}

# The printTerminal() function is used to print in the terminal and return to a new line
sub printTerminal{
      print colored(['Green BOLD'], "Eliza> ".$response."\n"); # The message is printed in a different color
}
