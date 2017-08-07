defmodule IssueTimerWeb.PageControllerTest do
  use IssueTimerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Issue Timer"
  end
end
