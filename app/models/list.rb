class List < ApplicationRecord
    include AlgoliaSearch
    algoliasearch do
        customRanking ['desc(stars)']

      end
    has_many :list_entry
end
