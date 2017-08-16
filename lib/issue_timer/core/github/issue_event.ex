defmodule IssueTimer.Core.Github.Event do
  @moduledoc """
    Retrieve github's events
  """

  @type user   :: %IssueTimer.User{}
  @type issues :: [any]
  @type owner  :: String.t
  @type repo   :: String.t

  @doc """
    Retrive events and issues from a repo
  """
  @spec list(owner, repo, issues, user) :: issues
  def list(owner, repo, issues, current_user) do
    client = Tentacat.Client.new(%{access_token: current_user.token})

    issues
    |> Enum.map(fn(issue) ->
      case issue.state do
        "closed" ->
          owner
          |> Tentacat.Issues.Events.list(repo, issue.number, client)
          |> generate_statistics(issue)
        _ ->
          %{ issue: issue, time_lapse: 0 }
      end
    end)
  end

  defp generate_statistics(issue_events, issue) do
    {:ok, first, _} = List.first(issue_events) |> convert_time
    {:ok, last, _} = List.last(issue_events) |> convert_time

    %{
      issue: issue,
      time_lapse: (last |> DateTime.diff(first)) / 60
    }
  end

  defp convert_time(nil), do: {:ok, DateTime.utc_now, 0}
  defp convert_time(%{"created_at" => created_at}), do: DateTime.from_iso8601(created_at)

end
