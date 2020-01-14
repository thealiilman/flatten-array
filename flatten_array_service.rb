class FlattenArrayService
  attr_accessor :array, :flattened_array

  def initialize(array)
    unless array.is_a?(Array)
      raise(ArgumentError, 'The argument given is not an array!')
    end

    if array.empty?
      raise(ArgumentError, 'The argument given is an empty array!')
    end

    unless array.any? { |element| element.is_a?(Array) }
      print("Thy array is flat\n", array) and return
    end

    @array = array
    @flattened_array = []
  end

  def self.run(array)
    new(array).run
  end

  def run
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
end
