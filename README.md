
ELIZA is an early natural language processing computer program created from 1964 to 1966 at the MIT Artificial Intelligence Laboratory by Joseph Weizenbaum.

##############################################################################
To use this program, you should open your terminal and type:  'PERL ELIZA.PL'
Notice: You should have Perl already installed in your machine.
##############################################################################

Examples of actual conversations done with Eliza:

E.g. 1
    Eliza> Hello, my name is Eliza, what's yours?
    User> Ali
    Eliza> Nice to meet you Ali, How can I help you?
    Ali> You can't, nobody can ..
    Eliza> You are maybe right, but let's try?
    Ali> Ok, I am feeling very bad
    Eliza> Ohh! why are you feeling bad?
    Ali> Because I am bored
    Eliza> Are you sure that's the only reason?
    Ali> Not really, I have no friends
    Eliza> Could you be more precise!
    Ali> I have no one as a friend
    Eliza> Why do you have no one as a friend?
    Ali> Because I am a bad person
    Eliza> Are you sure that's the only reason?
    Ali>
    
E.g. 2
    Eliza> Hello, my name is Eliza, what's yours?
    User> Hi Eliza, I am Ali
    Eliza> Nice to meet you Ali, How can I help you?
    Ali> I need to talk to someone
    Eliza> All you need is love. But a little chocolate now and then doesn't hurt.
    Ali> HAHA, you made me laugh! Who are you again?
    Eliza> I am Eliza, your psychiatric!
    Ali> Oh great! How can I overcome my bad mood?
    Eliza> Tell me more about your bad mood?.
    Ali> I feel rageful
    Eliza> I am glad you are sharing your thoughts. Can you tell me why do you feel rageful?
    Ali> I don't know
    Eliza> It's fine, just tell me how do you feel!
    Ali>

Overview on the algorithm used:
- Basic hashes to conjugate the verbs ‘to do’ and ‘to be’, in addition to another hash to convert pronouns for questions.
- It prompt the user for his/her name, then start the getting input from the user.
- It first take the output using the input function(), convert it to lower case and apply the chomp function on it.
- The input goes through some filter conditions that use regular expression to catch some paterns.
  The kind of pattern it catches are:
    * if the user is repeating himself
    * When the user is talking about something using 'MY' or 'IT', or talking about someone using 'HE' or 'SHE'
    * when the user is trying to make an argument
    * feelings and emotions
    * Responding to the question 'Who are you?'
    * when the user is addressing tio Eliza
    * questions
    * when the user is being negative
    * when the user is being confused
    * when the user needs something
    * statements that start with a pronoun to a question (dealing with 'I, HE, SHE and THEY')
