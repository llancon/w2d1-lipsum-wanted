#!/usr/bin/env ruby
require 'erb'

lipsum_wanted = ARGV[0].to_s.downcase
number_paragraphs = ARGV[1].to_i
if number_paragraphs <1
  number_paragraphs=1
end
  puts ARGV.inspect
  puts lipsum_wanted
  puts number_paragraphs.inspect
hipster = "<p>Church-key live-edge before they sold out, ugh blue bottle intelligentsia pork belly offal try-hard. Mlkshk tofu hella cornhole edison bulb occupy, dreamcatcher aesthetic semiotics everyday carry. Celiac cred glossier cold-pressed 90's, selvage XOXO tumeric. Lyft blog readymade, edison bulb literally fap iPhone cronut subway tile yuccie chia snackwave. Tbh affogato letterpress artisan meh air plant. Flexitarian forage pug readymade, drinking vinegar pop-up green juice kickstarter before they sold out organic master cleanse poke hot chicken marfa. Leggings banh mi +1, cronut umami iceland narwhal.</p>"
old = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur varius nisl eros, vel vestibulum neque condimentum eu. Suspendisse imperdiet pellentesque tortor. Vestibulum id mollis est. Morbi iaculis pharetra ex, at convallis ipsum pretium et. Nulla facilisi. Ut semper facilisis dignissim. Curabitur sagittis erat sit amet nunc consequat, vitae pretium nibh lobortis. Integer auctor purus ut tempus ullamcorper. Donec ornare mollis augue at laoreet. Morbi id metus quis arcu fermentum ullamcorper. Proin vel vestibulum tellus. Pellentesque sit amet pulvinar metus.</p>"
gym = "<p>We are an independent gym that is committed to working with you to gain the results you want. Whether your aim is to loose weight, tone up, build bulk or gain weight we can put together a gym programme or recommend the right classes for you to attend in our studios.</p>"
if lipsum_wanted == "hipster"
  output = hipster * number_paragraphs
elsif lipsum_wanted == "old"
  output = old * number_paragraphs
elsif lipsum_wanted == "gym"
  output = gym * number_paragraphs
else
puts "I don't understand bro, please enter: hipster, old or gym"
end

puts output.inspect
IO.popen("pbcopy", "w") { |pipe| pipe.puts output }
if output

new_file = File.open("./#{lipsum_wanted}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
end
