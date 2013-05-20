require 'test/unit'
require './solution.rb'

class SubSeqTest < Test::Unit::TestCase
	def setup
	  @examples =
    {
      [] => [],
      [1] => [],
      [5,1] => [],
      [3,4] => [3,4],
      [1,3,1] => [],
      [3,2,3] => [2,3],
      [0,2,4,5] => [4,5],
      [1,0,1,0,5] => [0,1],
      [0,1,5,1,3] => [0,1],
      [3,5,1,7,5] => [],
      [4,3,1,3,4,5] => [3,4,5],
      [1,2,3,0,3,4,5] => [1,2,3],
      [3,-1,0,1,2,4] => [-1,0,1,2],
      [1,0,1,2,3,0,4,5] => [0,1,2,3],
      [1,2,3,2,3,4,5] => [2,3,4,5],
      [1,1,2,3,0,4,3,3,4,5] => [1,2,3],
    };
	end

  def color(fg, bg = nil)
    return "#{fg ? "\x1b[38;5;#{fg}m" : ''}#{bg ? "\x1b[48;5;#{bg}m" : ''}";
  end
  def ec()
    return "\x1b[0m";
  end
  def green(str)
    return color(2) + str + ec();
  end
  def red(str)
    return color(1) + str + ec();
  end

	def test
    longestInput = @examples.keys().collect{|key| key.to_s().size}.max;
    puts longestInput
    puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
    puts "| #{'Input'.ljust(longestInput, ' ')} | #{'Expected'.rjust(longestInput, ' ')}  #{'Returned'.ljust(longestInput, ' ')} |";
    puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
    for input, correct in @examples
      returned = longestSequence(input);
      puts "| " + input.to_s().ljust(longestInput, ' ') + " | " + correct.to_s().rjust(longestInput,' ') + (returned == correct ? green('==') : red('!=')) + returned.to_s().ljust(longestInput, ' ') + " |";
      assert_equal(returned, correct);
    end
    puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
	end
end
