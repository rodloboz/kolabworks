defmodule Kolab.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    StatusEnum.create_type
    create table(:ideas) do
      add :name, :string
      add :tagline, :string
      add :summary, :text
      add :logo, :string
      add :status, StatusEnum.type()

      timestamps()
    end
  end
end
