#Essentially, I am keeping track of to first and last indicies of the longest lengthed sub-sequence.
#Only when a longer sequence is found do the current "longest"-indicies update.
#
#After looping through the entire array/vector, I check and make sure the longest sequence was greater than 1.
#
#This algoritm solves the problem in linear time. (For some odd resion, the couple places I looked online had nlongn soltions. So, hopefully I haven't missed something.)

def longestSequence (numbers)
  #If numbers.length > 0 then there is a subsequence of at least length 1.
  #This is important because my algorithm looks at the next element
  longest      = tempLength = 1;
  longestFirst = tempFirst  = 0;
  longestLast  = tempLast   = 0;
  
  while tempLast < numbers.length - 1 do
    tempLength = tempLength + 1;

    #If sequence elements can differ by more than 1 (e.g. [3,6,8] is a valid subsequence)
    #if numbers[tempLast] + 1 < numbers[tempLast + 1]

    #If the two elements are out of order restart the current sequence.
    if numbers[tempLast] + 1 != numbers[tempLast + 1]
      tempFirst = tempLast + 1;
      tempLength = 1;
    end

    tempLast += 1;
    if tempLength > longest
      longestFirst = tempFirst;
      longestLast = tempLast;
      longest = tempLength;
    end
  end

  #If the longest found subsequence is two or larger, slice it out of the array and return it.
  if longest > 1
    return numbers.slice(longestFirst, longestLast - longestFirst + 1);
  else #Else return an empty array.
    return [];
  end
end

def tests()
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

  examples = 
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
  longestInput = examples.keys().collect{|key| key.to_s().size}.max;
  puts longestInput
  puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
  puts "| #{'Input'.ljust(longestInput, ' ')} | #{'Expected'.rjust(longestInput, ' ')}  #{'Returned'.ljust(longestInput, ' ')} |";
  puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
  for input, correct in examples
    returned = longestSequence(input);

    puts "| " + input.to_s().ljust(longestInput, ' ') + " | " + correct.to_s().rjust(longestInput,' ') + (returned == correct ? green('==') : red('!=')) + returned.to_s().ljust(longestInput, ' ') + " |";
  end
  puts "+ #{    '-'.ljust(longestInput, '-')} + #{       '-'.rjust(longestInput, '-')}--#{       '-'.ljust(longestInput, '-')} +";
end

tests();

