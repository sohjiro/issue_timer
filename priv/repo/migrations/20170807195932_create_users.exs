defmodule IssueTimer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :token, :string
      add :avatar, :string
      add :name, :string
      add :username, :string
      add :bio, :string
      add :location, :string
      add :uid, :integer

      timestamps()
    end

  end
end
