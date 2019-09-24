class Image

  def initialize (photo)
    @photo = photo
  end

  def get_ones
    one = []
    @photo.each_with_index do |row, row_num|
      row.each_with_index do |item, col_num|
        if item == 1
          one << [row_num, col_num]
        end
      end
    end
    one
  end

  def blur!
    one = get_ones
      @photo.each_with_index do |row, row_num|
        row.each_with_index do |item, col_num|
          one.each do |found_row_num, found_col_num|

            if row_num == found_row_num && col_num == found_col_num
              @photo[row_num -1][col_num] = 1 unless row_num == 0 #up
              @photo[row_num +1][col_num] = 1 unless row_num >= 3 #down
              @photo[row_num][col_num -1] = 1 unless col_num == 0 #left
              @photo[row_num][col_num +1] = 1 unless col_num >= 3 #right
            end
          end
        end
      end
  end

  def output_image
    @photo.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

#This is the original image output
image.output_image
puts
image.blur!

#This is the blurred image output
image.output_image