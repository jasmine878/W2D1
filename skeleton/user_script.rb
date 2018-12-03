require_relative 'super_useful'
#require  and require relative copies and pastes everything inside 'super_useful'
# use just to load up normal code
#purpose is for DRY - Do not repeat yourself

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit

sam = BestFriend.new('', 1, '')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
