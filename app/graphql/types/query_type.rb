Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :lists, function: Resolvers::ListSearch

  field :me, Types::UserType do
    resolve -> (obj,args,ctx){
      ctx[:current_user]
    }
  end

  field :list, Types::ListType do
    argument :listid, types.Int
    resolve -> (obj,args,ctx){
      List.find(args[:listid])
    }
  end

end
