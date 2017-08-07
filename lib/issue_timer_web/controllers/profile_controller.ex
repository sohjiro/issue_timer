defmodule IssueTimerWeb.ProfileController do
  use IssueTimerWeb, :controller

  def profile(conn, _params) do

    current_user = get_session(conn, :current_user)
    Tentacat.Client.new(%{access_token: current_user.token})
    |> Tentacat.Repositories.list_mine
    |> IO.inspect

    render conn, "profile.html", current_user: get_session(conn, :current_user)
  end

end
