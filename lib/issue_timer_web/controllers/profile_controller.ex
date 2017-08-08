defmodule IssueTimerWeb.ProfileController do
  use IssueTimerWeb, :controller

  def profile(conn, _params) do
    current_user = get_session(conn, :current_user)
    IssueTimer.Core.Github.Repo.list_mine(current_user)

    render conn, "profile.html", current_user: current_user
  end

end
