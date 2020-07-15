module SkinCare

   class SkinCareBusiness

      @@all = []

      def self.all 
         @@all
      end

      def self.find_by_number(number)
         self.all[number.to_i - 1]
      end

      def self.load_by_location(location)
         search_results = API.yelp_search("skin care business", location)
         @@all = self.create_from_search_results(search_results)
      end

      def self.create_from_search_results(search_results)
         search_results.map do |skin_care_hashes|
            self.new(skin_care_hashes)
         end
      end

      attr_accessor :name, :rating, :location, :price, :phone, :address, :url
      #need access for all the methods, we can define attr_accessors for all those things
      
      def initialize(attributes={}) #we can use metaprogramming
         attributes.each do |key_attributes,value_attributes|
            if self.respond_to?("#{key_attributes}=")
               self.send("#{key_attributes}=", value_attributes)
            end
         end
      end

      def details
         <<-HEREDOC
         #{self.name.colorize(:yellow)} 
         Phone number: #{self.phone.colorize(:blue)}
         Location: #{self.location["address1"].colorize(:blue)}
         #{self.location["city"].colorize(:blue)} #{self.location["state"].colorize(:blue)} #{self.location["zip_code"].colorize(:blue)}
         Rating: #{self.rating}
         Price: #{self.price.colorize(:yellow)}
         Website: #{self.url.colorize(:blue)}
         
         HEREDOC
      end 
   end 
end




