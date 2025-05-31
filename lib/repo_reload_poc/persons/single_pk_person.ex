defmodule RepoReloadPoc.Persons.SinglePkPerson do
  use Ecto.Schema

  @primary_key {:id, :integer, [read_after_writes: true]}
  schema "single_pk_persons" do
    field :name, :string
  end
end
