defmodule PhoenixBlog.Post do
  use PhoenixBlog.Web, :model

  schema "posts" do
    field :body, :string
    field :word_count, :integer

    has_many :comments, PhoenixBlog.Comment

    timestamps
  end

  @required_fields ~w(body word_count)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
