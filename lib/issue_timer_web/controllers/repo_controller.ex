defmodule IssueTimerWeb.RepoController do
  use IssueTimerWeb, :controller

  def show(conn, %{"owner" => owner, "repo" => repo}) do
    current_user = get_session(conn, :current_user)
    issues = IssueTimer.Core.Github.Issue.list(owner, repo, current_user)
    data = IssueTimer.Core.Github.Event.list(owner, repo, issues, current_user)

    render conn, "show.html", current_user: current_user, data: data
  end

end
