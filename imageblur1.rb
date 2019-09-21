class Subary 
    attr_accessor :num1, :num2, :num3, :num4

    def initialize(sub_array)
        self.num1 = sub_array[0]
        self.num2 = sub_array[1]
        self.num3 = sub_array[2]
        self.num4 = sub_array[3]
    end

    def output_subary
        puts "#{num1}#{num2}#{num3}#{num4}"
    end
end

class Image
    def initialize(array_of_arrays)
        @subarys = []
        @subarys << Subary.new(array_of_arrays[0])
        @subarys << Subary.new(array_of_arrays[1])
        @subarys << Subary.new(array_of_arrays[2])
        @subarys << Subary.new(array_of_arrays[3])
    end

    def output_image
        @subarys.each do |list|
            list.output_subary
        end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image