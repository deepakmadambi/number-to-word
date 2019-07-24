# number-to-word

<b>Ruby Version : ruby 2.3.7</b>

<h2>Problem Statement</h2>
<p>
  Given a 10 digit phone number, you should return all possible words or combinations of words from the provided dictionary, that can be mapped back as a whole to the number.

With this we can generate numbers like 1-800-motortruck which is easier to remember than 1-800-6686787825.

The phone number mapping to letters is as follows:

2 = a b c
3 = d e f
4 = g h i
5 = j k l
6 = m n o
7 = p q r s
8 = t u v
9 = w x y z

The phone numbers will never contain a 0 or 1.
Words have to be at least 3 characters.

To give you an initial idea, here are some numbers that return (a lot of) results.

6686787825 returns a (long) list with at least these word combinations:

* motortruck
* motor, truck
* motor, usual
* noun, struck
* not, opt, puck

2282668687 returns a (long) list with at least these word combinations:

* catamounts
* acta, mounts
* act, amounts
* act, contour
* cat, boot, our

The conversion of a 10 digit phone number should be performed within 1000ms.

</p>

<h2>Step to excecute</h2>

1. Download the code or clone it from the link https://github.com/deepakmadambi8/phonenumber-word.git
2. Go to respective directory
3. $ gem install bundler
4. $ bundle install
5. run spec
    $ bundle exec rspec spec/phone_number_spec.rb

6. run code with user input.
  $ ruby lib/user_input.rb

<h2> Benchmarks. </h2>
<p>
number = 6686787825<br />
------------------------------<br />
[["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["noun", "struck"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]
<br />------------------------------ <br />
Time 0.455737 ms <br />
------------------------------ <br />
</p>
<h2> Steps followed </h2>

1. dictionary hash of number as keys and respective word as values..
2. create all possible combinations of given number.
3. find the respective word based on combined numbers.
4. Remove unwanted combinations.
