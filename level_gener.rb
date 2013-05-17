# encoding: utf-8

require 'json'

class String
  def only_consist_of?(set)
    self =~ /#{ ('^[%s]+$' % set) }/
  end
end

words_ru = %w(ложе фрод цап род вал цэ цуп дрова щуп пушка душ шов шуруп ушко гул дорога)

level_map_ru = {
    фывапролджэ: [],
    фывапролджэцщ: [],
    фывапролджэцщуш: [],
    фывапролджэцщушкг: [],
    фывапролджэцщушкген: [],
    фывапролджэцщушкгенйз: [],
    фывапролджэцщушкгенйзьти: [],
    фывапролджэцщушкгенйзьтисм: [],
    фывапролджэцщушкгенйзьтисмяч: [],
    фывапролджэцщушкгенйзьтисмяч: [], }

level_map_ru.each do |level, _|
  words_ru.each do |word|
    level_map_ru[level] << word if word.only_consist_of? level.to_s
  end
end

level_map_ru.each do |_, word_list|
  word_list.sort!
end

#puts level_map_ru.to_json
puts JSON.pretty_generate level_map_ru