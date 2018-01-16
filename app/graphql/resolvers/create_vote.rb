class Resolvers::CreateVote < GraphQL::Function
    argument :listID, types.ID
  
    type Types::ListType
  
    def call(_obj, args, ctx)
       list = List.find(args[:listID])
       user = ctx[:current_user]
       user.likes list
       return list
    end

end