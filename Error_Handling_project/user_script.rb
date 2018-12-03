require_relative 'super_useful'
# require  and require relative copies and pastes everything inside 'super_useful'
# use just to load up normal code
# purpose is for DRY - Do not repeat yourself

puts "'five' == #{convert_to_int('five')}" # Phase 2

feed_me_a_fruit # Phase 3

# Phase 4
sam = BestFriend.new('Tae Hui', 5, 'Coding')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
