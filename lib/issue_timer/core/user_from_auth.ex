defmodule IssueTimer.Core.UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias Ueberauth.Auth
  alias IssueTimer.{Repo, User}

  @doc """
    Find or create user from github response

    ## Parameters

      - auth: Authentication struct from Ueberauth.Auth
  """
  def find_or_create(%Auth{} = auth) do
    case Repo.get_by(User, uid: auth.uid) do
      nil ->
        auth
        |> basic_info
        |> Repo.insert
      user -> {:ok, user}
    end
  end

  defp basic_info(auth) do
    %User{
      uid: auth.uid,
      name: auth.info.name,
      avatar: auth.info.urls.avatar_url,
      location: auth.info.location,
      username: auth.info.nickname,
      token: auth.credentials.token
    }
  end

end
