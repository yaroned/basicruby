
require_relative '../WordCountParser'

describe WordCountParser do
	wcp = WordCountParser.new("test_dir/")
	it "verify 2 files" do
		wcp.form_dictionary()
		expect(wcp.instance_variable_get(:@num_of_books)).to be 2
		# wcp.print_dictionary_to_file("xx.txt")
	end
	
	it "words counted correctly" do
     # puts wcp.instance_variable_get(:@WORDS_COUNT)["the"].is_a?(Fixnum)
    expect(wcp.instance_variable_get(:@WORDS_COUNT)["the"]).to be 4
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["small"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["white"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["wolf"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["rested"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["near"]).to be 1

		expect(wcp.instance_variable_get(:@WORDS_COUNT)["crazy"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["old"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["lady"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["big"]).to be 1

		expect(wcp.instance_variable_get(:@WORDS_COUNT)["brown"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["fox"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["jumps"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["over"]).to be 2
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["lazy"]).to be 1
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["dog"]).to be 3
  end

	it "none existing words" do
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["yaron"]).to be nil
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["otherwords"]).to be nil
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["more otherwords"]).to be nil
  end

	it "special marks should be ignored" do
		expect(wcp.instance_variable_get(:@WORDS_COUNT)[";"]).to be nil
		expect(wcp.instance_variable_get(:@WORDS_COUNT)["!!"]).to be nil
  end
end


# 1st file : the big brown fox jumps over over the lazy dog dog dog
# 2nd file : the small white wolf rested near the crazy old lady
#
#verify:
# the : 4
# small : 1
# white : 1
# wolf : 1
# rested : 1
# near : 1
# crazy : 1
# old : 1
# lady : 1
# big : 1
# brown : 1
# fox : 1
# jumps : 1
# over : 2
# lazy : 1
# dog : 3