class List < ApplicationRecord
    include AlgoliaSearch
    algoliasearch do
        customRanking ['desc(stars)']
    end
    has_many :list_entry

    before_save :update_info

    def update_info
        GitRepoService.new({list:self}).updateInfo
    end

end
