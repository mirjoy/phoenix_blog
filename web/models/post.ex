defmodule PhoenixBlog.Post do
  use PhoenixBlog.Web, :model
  import Ecto.Query

  schema "posts" do
    field :body, :string
    field :word_count, :integer

    has_many :comments, PhoenixBlog.Comment, on_delete: :delete_all

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

  def count_comments(query) do
    from p in query,
      group_by: p.id,
      left_join: c in assoc(p, :comments),
      select: {p, count(c.id)}
  end
end
