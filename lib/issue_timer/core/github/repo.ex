defmodule IssueTimer.Core.Github.Repo do
  defstruct name: "", description: "", html_url: "", full_name: "", created_at: "", updated_at: "", pushed_at: "", id: 0
  @moduledoc """
  Retrieve user's repo information
  """

  @type user :: %IssueTimer.User{}
  @type repo :: %IssueTimer.Core.Github.Repo{}
  alias IssueTimer.Core.Github.Repo

  @doc """
    User's repo sorted by updated
  """
  @spec list_mine(user) :: [repo]
  def list_mine(current_user) do
    Tentacat.Client.new(%{access_token: current_user.token})
    |> Tentacat.Repositories.list_mine(type: "owner", sort: "updated")
    |> Enum.map(&map_response/1)
  end

  defp map_response(repo_raw) do
    %Repo{
      name: repo_raw["name"],
      description: repo_raw["description"],
      html_url: repo_raw["html_url"],
      full_name: repo_raw["full_name"],
      created_at: repo_raw["created_at"],
      updated_at: repo_raw["updated_at"],
      pushed_at: repo_raw["pushed_at"],
      id: repo_raw["id"]
    }
  end
end
