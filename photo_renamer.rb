require_relative './photo'

class PhotoRenamer
    def initialize(input:)
        # We know we need to split the lines, so we do it here.
        @input = input.lines
        @photos = []
    end

    def rename
        # Let's kick things off. First, we want to go through the list of photos, and
        # build a Struct for each of them. We use `each_with_index` so we can track the position
        # of the photo.
        @input.each_with_index do |photo, index|
           built_photo =  build_photo(line: photo, index: index) 

           @photos << built_photo if  built_photo.valid?
        end

        # Now we sort the photos by city, and then by timestamp.
        @photos.sort_by! { |photo| [photo.city, photo.timestamp] }

        city_counts = count_cities(photos: @photos)

        # Now that we have the total count of city photos, we can create the new name,
        # for each photo.
        @photos.each do |photo|
            photo.build_name(city_count: city_counts[photo.city][:count].to_s.length)
        end

        # Finally, we sort the photos by their original position, and then map the new name.
        @photos.sort_by { |photo| photo.position }.map { |photo| photo.new_name }.join("\n")
    end

    private

    # Builds the new name for the photo.
    # @param [Photo] photo: The photo struct.
    # @param [Integer] city_count: The number of photos in the city.
    # @return [String] The new name.
    def build_new_name(photo:, city_count:)
        "#{photo.city}#{photo.number.to_s.rjust(city_count, '0')}.#{photo.extension}"
    end

    # Counts up the total number of photos per city, and rolls that up
    # as a hash.
    # @param [Array<Photo>] photos: The list of photos to count.
    # @return [Hash] The hash of city counts.
    def count_cities(photos:)
        # We need a way to count the number of photos per city.
        # This is an ideal place to use a hash. We use the city as the key and the
        # count as the value.
        city_counts = {}

        # Here we are going to iterate through the photos and increment the count
        # for each city.
        @photos.each do |photo|
            city_counts[photo.city] = Hash.new(0) unless city_counts[photo.city]
            city_counts[photo.city][:count] += 1
            photo.number = city_counts[photo.city][:count]
        end

        city_counts
    end

    # Builds a photo struct from a line of text, and an index.
    # @param [String] line: The line of text to parse.
    # @param [Integer] index: The index of the photo.
    # @return [Photo] The photo struct.
    def build_photo(line:, index:)
        # We know that the line is a string, and we know that it is comma separated.
        # We can use `split` to break it up into an array. We then use a map to remove
        # any whitespace from the elements.
        name_with_extension, city, timestamp = line.split(", ").map(&:strip)

        # We know that the name and extension are separated by a period. We can use
        # `split` again to break them up.
        name, extension = name_with_extension.split(".")

        Photo.new(position: index, name: name, extension: extension, city: city, timestamp: timestamp)
    end
end