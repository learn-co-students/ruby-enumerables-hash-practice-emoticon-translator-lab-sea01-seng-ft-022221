# require modules here
  require 'yaml'
  require 'pry'
  
def load_library(file)
 file_to_library = YAML.load_file(file)
 hash = {}
 
 file_to_library.each do |key, value|
   hash[key] = {}
   hash[key][:english] = value[0]
   hash[key][:japanese] = value[1]
 end
 hash
end 


def get_japanese_emoticon(file, emoji)
  library = load_library(file)
  emoji = library.keys.find do |key|
    library[key][:english] == emoji
  end
  emoji ? library[emoji][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoji)
   library = load_library(file)
  emoji = library.keys.find do |key|
    library[key][:japanese] == emoji
  end
  emoji ? emoji : "Sorry, that emoticon was not found"
end