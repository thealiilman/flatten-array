class FlattenArrayService
  attr_reader :array

  def initialize(array)
    unless array.is_a?(Array)
      raise(ArgumentError, 'The argument given is not an array!')
    end

    if array.empty?
      raise(ArgumentError, 'The argument given is an empty array!')
    end

    @array = array
  end

  def self.run(array)
    new(array).run
  end

  def run
    return print("Thy array is flat!\n#{array}") unless has_nested_array?

    flatten_array(array)
  end
 
  private

  def flatten_array(array)
    array.each_with_object([]) do |element, flattened_array|
      next (flattened_array << element) unless element.is_a?(Array)

      flattened_array.concat(flatten_array(element))
    end
  end

  def has_nested_array?
    array.any? { |element| element.is_a?(Array) }
  end
end
