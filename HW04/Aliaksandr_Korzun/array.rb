class Array
  def my_each
    index = 0
    while index < length
      yield self[index]
      index += 1
    end
    self
  end

  def my_map
    return_array = []
    my_each { |element| return_array << yield(element) }
    return_array
  end

  def my_select
    return_array = []
    my_each do |element|
      return_array << element if yield(element) == true
    end
    return_array
  end
end
