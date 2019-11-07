defmodule Kolab.ProjectsTest do
  use Kolab.DataCase

  alias Kolab.Projects

  describe "ideas" do
    alias Kolab.Projects.Idea

    @valid_attrs %{
      logo: "some logo",
      name: "some name",
      summary: "some summary",
      tagline: "some tagline"
    }
    @update_attrs %{
      logo: "some updated logo",
      name: "some updated name",
      summary: "some updated summary",
      tagline: "some updated tagline"
    }
    @invalid_attrs %{logo: nil, name: nil, summary: nil, tagline: nil}

    def idea_fixture(attrs \\ %{}) do
      {:ok, idea} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_idea()

      idea
    end

    test "list_ideas/0 returns all ideas" do
      idea = idea_fixture()
      assert Projects.list_ideas() == [idea]
    end

    test "get_idea!/1 returns the idea with given id" do
      idea = idea_fixture()
      assert Projects.get_idea!(idea.id) == idea
    end

    test "create_idea/1 with valid data creates a idea" do
      assert {:ok, %Idea{} = idea} = Projects.create_idea(@valid_attrs)
      assert idea.logo == "some logo"
      assert idea.name == "some name"
      assert idea.summary == "some summary"
      assert idea.tagline == "some tagline"
    end

    test "create_idea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_idea(@invalid_attrs)
    end

    test "update_idea/2 with valid data updates the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{} = idea} = Projects.update_idea(idea, @update_attrs)
      assert idea.logo == "some updated logo"
      assert idea.name == "some updated name"
      assert idea.summary == "some updated summary"
      assert idea.tagline == "some updated tagline"
    end

    test "update_idea/2 with invalid data returns error changeset" do
      idea = idea_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_idea(idea, @invalid_attrs)
      assert idea == Projects.get_idea!(idea.id)
    end

    test "delete_idea/1 deletes the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{}} = Projects.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_idea!(idea.id) end
    end

    test "change_idea/1 returns a idea changeset" do
      idea = idea_fixture()
      assert %Ecto.Changeset{} = Projects.change_idea(idea)
    end
  end
end
