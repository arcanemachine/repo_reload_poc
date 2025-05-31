defmodule RepoReloadPoc.Persons do
  @moduledoc "The Persons context."

  alias RepoReloadPoc.Persons.MultiPkPerson
  alias RepoReloadPoc.Persons.SinglePkPerson
  alias RepoReloadPoc.Repo

  def create_single_pk_person!(name), do: Repo.insert!(%SinglePkPerson{name: name})

  def create_multi_pk_person!(name), do: Repo.insert!(%MultiPkPerson{name: name})

  def update_person_name!(%_{} = person, name),
    do: Ecto.Changeset.change(person, %{name: name}) |> Repo.update!()
end
