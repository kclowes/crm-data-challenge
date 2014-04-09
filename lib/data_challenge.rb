class DataChallenge
  def initialize(original_array)
    @original_array = original_array
  end

  attr_reader :original_array

  def first_name
    first_name_array = []
    i = 0
    while i < @original_array[0][:employees].length
    a = @original_array[0][:employees][i][:first_name]
    i += 1
    first_name_array << a
    end
  first_name_array
  end
end