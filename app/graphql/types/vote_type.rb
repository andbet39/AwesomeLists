Types::VoteType = GraphQL::ObjectType.define do
    name "Vote"
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
  
    field :id ,!types.ID
  end
  