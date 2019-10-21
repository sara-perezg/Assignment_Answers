require './functions.rb'
require './Gene.rb'

class Seed_stock

    #attr_accessor :mutant_gene_ID  
    attr_accessor :seed_stock
    attr_accessor :last_planted
    attr_accessor :storage
    attr_accessor :grams_remaining
    
    @@number_of_stocks = 0 #class variable, it is shared within the class
    
    def initialize (parms = {}) # get a name from the "new" call, or set a default
      
      @mutant_gene_ID = parms.fetch(Gene.gene_ID, "000000")
      @seed_stock = parms.fetch(:seed_stock, "storage0")
      @last_planted = parms.fetch(:last_planted, "date")
      @storage = parms.fetch(:storage, "cama0")
      @grams_remaining = parms.fetch(:grams_remaining, 3)
      
      @@number_of_stocks += 1
    end
    
    def self.total_stocks
      return @@number_of_stocks
    end
    
    def self.insert_data(data)
        
        data_array = Array.new
        my_csv=read_csv(data)
        for row in my_csv
          data_array << Seed_stock.new(
            :mutant_gene_ID => row[0], 
            :seed_stock => row[1], 
            :last_planted => row[2],
            :storage => row[3],
            :grams_remaining => row[4] 
            )
        end
        return data_array
    end
end

# =====================================================================================
