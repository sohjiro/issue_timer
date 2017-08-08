defmodule IssueTimer.Core.UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """
  @type auth :: %Ueberauth.Auth{}
  @type user :: %IssueTimer.User{}

  alias Ueberauth.Auth
  alias IssueTimer.{Repo, User}

  @doc """
    Find or create an user from github response
  """
  @spec find_or_create(auth) :: user
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
