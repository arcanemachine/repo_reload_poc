defmodule RepoReloadPoc do
  alias RepoReloadPoc.Repo

  @doc "Similar to `Repo.reload/2`, but supports structs with multiple primary keys."
  def reload(%_{} = struct, opts \\ []) do
    case struct.__struct__.__schema__(:primary_key) do
      [_pk] ->
        Repo.reload(struct, opts)

      _pks ->
        get_by_clauses =
          struct.__struct__.__schema__(:primary_key)
          |> Keyword.new(fn primary_key_field ->
            {primary_key_field, Map.fetch!(struct, primary_key_field)}
          end)

        Repo.get_by(struct.__struct__, get_by_clauses, opts)
    end
  end

  @doc "Similar to `Repo.reload!/2`, but supports structs with multiple primary keys."
  def reload!(%_{} = struct, opts \\ []) do
    case struct.__struct__.__schema__(:primary_key) do
      [_pk] ->
        Repo.reload!(struct, opts)

      _pks ->
        get_by_clauses =
          struct.__struct__.__schema__(:primary_key)
          |> Keyword.new(fn primary_key_field ->
            {primary_key_field, Map.fetch!(struct, primary_key_field)}
          end)

        Repo.get_by!(struct.__struct__, get_by_clauses, opts)
    end
  end
end
