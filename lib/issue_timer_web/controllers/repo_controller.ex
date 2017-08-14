defmodule IssueTimerWeb.RepoController do
  use IssueTimerWeb, :controller

  def show(conn, _params) do
    current_user = get_session(conn, :current_user)

    render conn, "show.html", current_user: current_user
  end

end
