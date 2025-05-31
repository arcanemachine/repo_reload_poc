defmodule RepoReloadPoc.Persons.MultiPkPerson do
  use Ecto.Schema

  @primary_key false
  schema "multi_pk_persons" do
    field :id1, :integer, primary_key: true, read_after_writes: true
    field :id2, :integer, primary_key: true, read_after_writes: true
    field :name, :string
  end
end
