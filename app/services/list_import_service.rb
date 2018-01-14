
require 'csv'    

class ListImportService

    def import
        
        csv_text = File.read('list.csv')
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            csv_row = row.to_hash

            List.where(:url => csv_row['url']).first_or_initialize do |list|
                list.name = csv_row['name']
                list.save
            end
        end
    
    end
end