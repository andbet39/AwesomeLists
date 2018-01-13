require 'open-uri'

class GitRepoService

    def initialize(params)
        @list =params[:list]
        @repo_url  = @list.url
    end

    def updateInfo
        
        Octokit.configure do |c|
            c.connection_options = { ssl: { verify: false } }
        end

        repo = Octokit::Repository.from_url(@repo_url)
        url = "https://api.github.com/#{repo.path}"

        general =  JSON.parse(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read)
        readme =   Octokit.readme( repo )
        
        
        @list.readme_raw_path = readme[:download_url]
        @list.readme_view_path = readme[:html_url]
        @list.stars =  general['stargazers_count']
        @list.pushed_at = general['pushed_at']
        #@list.markdown = open(readme[:download_url],:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read

        return @list
                
    end

end