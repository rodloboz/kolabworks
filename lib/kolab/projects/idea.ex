defmodule Kolab.Projects.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ideas" do
    field :logo, :string
    field :name, :string
    field :summary, :string
    field :tagline, :string
    field :status, StatusEnum

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:name, :tagline, :summary, :logo, :status])
    |> validate_required([:name, :tagline, :summary, :logo])
  end
end
