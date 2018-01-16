require 'search_object/plugin/graphql'
class Resolvers::ListSearch
    include SearchObject.module(:graphql)

    scope { List.all }
  
    type !types[Types::ListType]
  
    ListFilter = GraphQL::InputObjectType.define do
      name 'ListFilter'
      argument :OR, -> { types[ListFilter] }
      argument :contains, types.String
      argument :id, types.Int
    end

    OrderEnum = GraphQL::EnumType.define do
        name 'ListOrder'
  
        value 'RECENT'
        value 'NAME'
        value 'STARRED'
      end
  
    # when "filter" is passed "apply_filter" would be called to narrow the scope
    option :filter, type: ListFilter, with: :apply_filter
    option :order, type: OrderEnum, default: 'RECENT'


    def apply_order_with_recent(scope)
        scope.order 'id DESC'
      end
  
    def apply_order_with_name(scope)
        scope.order 'name ASC'
    end
    
      def apply_order_with_starred(scope)
        scope.order 'stars DESC'
    end

    # apply_filter recursively loops through "OR" branches
    def apply_filter(scope, value)
      # normalize filters from nested OR structure, to flat scope list
      branches = normalize_filters(value).reduce { |a, b| a.or(b) }
      scope.merge branches
    end
  
    def normalize_filters(value, branches = [])
      # add like SQL conditions
      scope = List.all
      scope = scope.where('name LIKE ? or description LIKE ? ', "%#{value['contains']}%","%#{value['contains']}%") if value['contains']  
      branches << scope
  
      # continue to normalize down
      value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?
  
      branches
    end
  end