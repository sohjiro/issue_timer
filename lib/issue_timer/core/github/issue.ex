defmodule IssueTimer.Core.Github.Issue do
  @moduledoc """
    Retrieve issue's from a repo
  """

  alias IssueTimer.Core.Github.Issue
  alias IssueTimer.User
  defstruct id: 0, body: "", html_url: "", number: 0, state: "", title: "", created_at: "", updated_at: "", closed_at: "", user: %User{}

  @type user   :: %IssueTimer.User{}
  @type owner  :: String.t
  @type repo   :: String.t
  @type issue  :: %IssueTimer.Core.Github.Issue{}
  @type issues :: [issue]

  @doc """
    Issues from a repo
  """
  @spec list(owner, repo, user) :: issues
  def list(owner, repo, current_user) do
    client = Tentacat.Client.new(%{access_token: current_user.token})

    Tentacat.Issues.filter(owner, repo, %{state: "all"}, client)
    |> Enum.map(&map_response/1)
  end

  defp map_response(issue_raw) do
    %Issue{
      id: issue_raw["id"],
      body: issue_raw["body"],
      html_url: issue_raw["html_url"],
      number: issue_raw["number"],
      state: issue_raw["state"],
      title: issue_raw["title"],
      created_at: issue_raw["created_at"],
      updated_at: issue_raw["updated_at"],
      closed_at: issue_raw["closed_at"],
      user: IssueTimer.Core.UserFromAuth.from_issue(issue_raw["user"])
    }
  end

end

