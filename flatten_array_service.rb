class FlattenArrayService
  attr_accessor :array, :flattened_array

  def initialize(array)
    validate_array_on_initialize(array)

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

  def validate_array_on_initialize(array)
    unless array.is_a?(Array)
      raise(ArgumentError, 'The argument given is not an array!')
    end

    if array.empty?
      raise(ArgumentError, 'The argument given is an empty array!')
    end

    unless array.any? { |element| element.is_a?(Array) }
      raise(ArgumentError, "Thy array is flat!\n#{array}")
    end
  end
end
