defmodule Polls.Repo.Migrations.CreatePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :question, :string

      timestamps(type: :utc_datetime)
    end
  end
end
