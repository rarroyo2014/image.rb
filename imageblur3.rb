class Image

  def initialize (photo)
    @photo = photo
  end

  def get_ones
    one = []
    @photo.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          one << [row_number, col_number]
        end
      end
    end
    one
  end

  def blur!(blur_distance)
    one = get_ones

    @photo.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        one.each do |found_row_number, found_col_number|
          if manhattan_distance(col_number, row_number, found_col_number, found_row_number) <= blur_distance
            @photo[row_number][col_number] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horiz_distance = (x2 - x1).abs
    vert_distance = (y2 - y1).abs
    horiz_distance + vert_distance
  end

  def output_image
    @photo.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])


image.output_image
puts


image.blur!(2)
image.output_image