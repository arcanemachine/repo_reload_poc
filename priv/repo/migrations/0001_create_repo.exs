defmodule RepoReloadPoc.Repo.Migrations.CreateRepo do
  use Ecto.Migration

  def change do
    # Use a single sequence to generate all IDs to ensure that there are no duplicate IDs anywhere
    # (This ensures that no IDs will ever line up accidentally)
    execute "CREATE SEQUENCE id_seq"

    create table(:single_pk_persons,
             primary_key: [name: :id, type: :integer, default: fragment("nextval('id_seq')")]
           ) do
      add :name, :string
    end

    create unique_index(:single_pk_persons, [:name])

    create table(:multi_pk_persons, primary_key: false) do
      add :id1, :integer, default: fragment("nextval('id_seq')"), primary_key: true
      add :id2, :integer, default: fragment("nextval('id_seq')"), primary_key: true
      add :name, :string
    end

    create unique_index(:multi_pk_persons, [:name])
  end
end
