# WordCountParser - the constructor accepts a directory path contains .txt files and form a word-count dictionary
# num_of_books - the number of .txt files in the directory
# names - array consists of the .txt files names in the directory
# WORDS_COUNT - word count dictionary

class WordCountParser

  def initialize(dir_path)
    @num_of_books = 0
    @names = Array.new
    @WORDS_COUNT = {}
    @dir_path = dir_path
  end


  def form_dictionary()
    Dir.foreach(@dir_path){|file|
      next if file == '.' or file == '..'
      @names << file
      @num_of_books +=1
    }
    @names.each { |x| index_one(x) }
  end


  # Print dicationary to file
  # Params:
  # +file_name+:: output file name
  def print_dictionary_to_file(file_name)
    #old_stdout = $stdout
    File.open(file_name, 'w') { |file|
      @WORDS_COUNT.each do |key, value|
        file.puts( key + ' : ' + value.to_s)
      end
    }
  end


  # Sort by "key" or "value"
  # Params:
  # +entity+:: can be either "key" or "value"
  def sort_by(entity)
    case entity
    when "value"
      @WORDS_COUNT = @WORDS_COUNT.sort_by {|a,b| b}
    when "key"
      @WORDS_COUNT = @WORDS_COUNT.sort_by {|a,b| a}
    end
  end

  private


  # Indexes a file to the dicationary (in this case: book)
  # Params:
  # +book_name+:: .txt file path in the directory path
  def index_one(book_name)

    file = File.open( @dir_path+book_name, "r")

    puts "Indexing #{book_name}"

    file.each_line do |line|
      words = line.split
      words.each do |word|
        #word = word.gsub(/[^a-zA-Z0-9-]+/i, "").downcase
        word = word.gsub(/[;.""...,()?!]+/i, "").downcase
        if @WORDS_COUNT[word]
          @WORDS_COUNT[word] += 1
        else
          @WORDS_COUNT[word] = 1
        end
      end
    end

    puts "Indexed #{book_name}"
  end


end