class Photo
    attr_accessor :position, :name, :extension, :city, :timestamp, :number, :new_name

    def initialize(position:, name:, extension:, city:, timestamp:, number: nil)
        @position = position
        @name = name
        @extension = extension
        @city = city
        @timestamp = timestamp
        @number = number
    end

    def build_name(city_count:)
        @new_name = "#{city}#{number.to_s.rjust(city_count, '0')}.#{extension}"
    end

    # Validates the photo.
    # @return [Boolean] Whether or not the photo is valid.
    def valid?
        !timestamp.nil? && !timestamp.empty? && !timestamp.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/).nil? &&
        !name.nil? && !name.empty? &&
        !extension.nil? && !extension.empty? &&
        !city.nil? && !city.empty?
    end
end