class FlattenArrayService
  attr_reader :array, :flattened_array

  def initialize(array)
    unless array.is_a?(Array)
      raise(ArgumentError, 'The argument given is not an array!')
    end

    if array.empty?
      raise(ArgumentError, 'The argument given is an empty array!')
    end

    @array = array
    @flattened_array = []
  end

  def self.run(array)
    new(array).run
  end

  def run
    return print("Thy array is flat!\n#{array}") unless has_nested_array?

    flatten_array
    flattened_array
  end
 
  private

  def flatten_array
    array.each do |element|
      next flattened_array.push(element) unless element.is_a?(Array)

      @array = element
      flatten_array
    end
  end

  def has_nested_array?
    array.any? { |element| element.is_a?(Array) }
  end
end
