defmodule IssueTimer.Core.Github.Repo do
  @type user :: %IssueTimer.User{}

  @spec list_mine(user) :: [any]
  def list_mine(current_user) do
    all = Tentacat.Client.new(%{access_token: current_user.token})
    |> Tentacat.Repositories.list_mine(type: "owner")

    IO.inspect(all |> hd)
    all
  end
end
