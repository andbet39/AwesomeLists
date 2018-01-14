require 'open-uri'

class GitRepoService

    def initialize(params)
        @list = params[:list]
        @repo_url  = @list.url
    end

    def updateInfo
        
        Octokit.configure do |c|
            c.connection_options = { ssl: { verify: false } }
        end

        client = Octokit::Client.new :client_id=> "Iv1.0d20ccce992a0522", :client_secret => "917b52da054c4602f6cce5b0d05b9e77e8ad90e6"
        client.connection_options[:ssl] = { :verify => false }
        limit = client.rate_limit!
        puts limit

        repo = Octokit::Repository.from_url(@repo_url)
        
        url = "https://api.github.com/#{repo.path}"

        general =  client.get(url) #JSON.parse(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)
        readme =   Octokit.readme( repo )
        
        @list.readme_raw_path = readme[:download_url]
        @list.readme_view_path = readme[:html_url]

        @list.stars =  general['stargazers_count']
        @list.pushed_at = general['pushed_at']
        @list.description = general['description']
        #@list.markdown = open(readme[:download_url],:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read

        return @list
                
    end

end