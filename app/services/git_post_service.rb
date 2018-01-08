class GitPostService

    def initialize(params)
        @post = params[:post]
    end

    def getstar
    
    end

    def reposname
        if isgithub
            @post.repo_url.split('/')[4]
        end

    end

    def isgithub
        
        if @post.repo_url.include? "github"
            true
        else
            false
        end
    
    end
end