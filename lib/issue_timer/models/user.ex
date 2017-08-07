defmodule IssueTimer.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias IssueTimer.User


  schema "users" do
    field :avatar, :string
    field :bio, :string
    field :location, :string
    field :name, :string
    field :token, :string
    field :uid, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:token, :avatar, :name, :username, :bio, :location, :uid])
    |> validate_required([:token, :avatar, :name, :username, :bio, :location, :uid])
  end
end
