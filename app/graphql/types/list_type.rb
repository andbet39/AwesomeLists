Types::ListType = GraphQL::ObjectType.define do
    # this type is named `Link`
    name 'List'
  
    # it has the following fields
    field :id, !types.ID
    field :url, !types.String
    field :description, !types.String
    field :name, !types.String
    field :description, !types.String
    field :stars, !types.Int
    field :pushed_at, !types.String
    field :readme_raw_path, !types.String
    field :readme_view_path, !types.String
    field :created_at, !types.String
    field :updated_at, !types.String

  end