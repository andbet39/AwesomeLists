require 'open-uri'

class ListParserService

    def initialize(params)
        @list = params[:list]
        
    end

    def parse
        
        f = open( @list.readme_raw_path ,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
        
        category =""
        subcategory=""

        f.each_line do |line|

            if (line.include? "###" )
                subcategory = line.gsub("###","").strip
                puts subcategory
            elsif (line.include? "##")
                category = line.gsub("##","").strip
                puts category
            end

            if (category == "")
                category=subcategory
            end     

            if (line.include? "https://" and (line.strip[0]=="*" or line.strip[0] == "-"))

                title_idx_start = line.index("[").to_i
                title_idx_end = line.index("]").to_i
                link_idx_start = line.index("(").to_i
                link_idx_end = line.index(")").to_i

                if title_idx_end >0
                    title  = line[title_idx_start+1..title_idx_end-1]
                    link  = line[link_idx_start+1..link_idx_end-1]
                    description = line[link_idx_end+2..-1]
                    @list.list_entry.build(title:title , url:link, description: description,category:category,subcategory:subcategory)
                    @list.save

                end
            end
        end
    
    
    end
end