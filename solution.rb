#Essentially, I am keeping track of to first and last indicies of the longest lengthed sub-sequence.
#Only when a longer sequence is found do the current "longest"-indicies update.
#
#After looping through the entire array/vector, I check and make sure the longest sequence was greater than 1.
#
#This algoritm solves the problem in linear time. (For some odd resion, the couple places I looked online had nlongn soltions. So, hopefully I haven't missed something.)

def longestSequence (numbers)
  tempFirst = 0;
  tempLast = 0;
  tempLength = 1;
  longestFirst = nil;
  longestLast = nil;
  longest = 1;
  for i in (0..numbers.length)
    if numbers[i + 1] != nil

      #If integers can differ by more than 1
      #if numbers[i] < numbers[i + 1]
      if numbers[i + 1] - numbers[i] == 1
        tempLast = i + 1;
        tempLength += 1;

        if tempLength > 1 and tempLength > longest
          longestFirst = tempFirst;
          longestLast = tempLast;
          longest = tempLength;
        end

      else
        tempFirst = i + 1;
        tempLast = i + 1;
        tempLength = 1;
      end

    end
  end

  if longest > 1
    numbers.slice(longestFirst, longestLast - longestFirst + 1);
  else
    return [];
  end
end

def tests()
  def green; 2; end
  def red; 1; end 
  def c( fg, bg = nil ); "#{fg ? "\x1b[38;5;#{fg}m" : ''}#{bg ? "\x1b[48;5;#{bg}m" : ''}" end
  def ec; "\x1b[0m"; end

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
  puts "#{'Expected'.rjust(14, ' ')}    Result";
  for example, expected in examples
    puts "#{expected.to_s().rjust(14,' ')} #{((longestSequence(example) == expected) ? c(green) + '==' : c(red) + "!=") + ec()} #{longestSequence(example)}";
  end
end



