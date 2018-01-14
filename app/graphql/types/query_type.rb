Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allLists, !types[Types::ListType] do
    resolve -> (obj, args, ctx) { List.all }
  end

  field :me, Types::UserType do
    resolve -> (obj,args,ctx){
      ctx[:current_user]
    }
  end
end
