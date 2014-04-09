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

  def add_employee(new_emp_first_name, new_emp_last_name)
    place_in_the_array = @original_array[0][:employees]
    adding_index = place_in_the_array.count.to_i
    place_in_the_array[adding_index]= {first_name: new_emp_first_name,
                                       last_name: new_emp_last_name}
    @original_array
  end

end