module SequencesHelper
  def squares(array)
    result_array = []
    array.each_with_index do |n, i|
      if  Math.sqrt(n).to_r.denominator == 1
        temp_array = array.slice(i, array.size - i)
        res = temp_array.take_while { |temp| Math.sqrt(temp).to_r.denominator == 1 }
        result_array.push(res)
      end
    end
    result_array
  end
end
