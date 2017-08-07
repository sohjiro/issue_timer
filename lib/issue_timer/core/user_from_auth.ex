defmodule IssueTimer.Core.UserFromAuth do
  @moduledoc """
  Retrieve the user information from an auth request
  """

  alias Ueberauth.Auth

  @doc """
    Find or create user from github response

    ## Parameters

      - auth: Authentication struct from Ueberauth.Auth

    ## Examples

        iex> auth = %Ueberauth.Auth{credentials: %Ueberauth.Auth.Credentials{token: "token"}, info: %Ueberauth.Auth.Info{location: "location", name: "Some Name", nickname: "nickname", urls: %{avatar_url: "avatar_url"}}, uid: 1111}
        iex> IssueTimer.Core.UserFromAuth.find_or_create(auth)
        {:ok, %{id: 1111, name: "Some Name", avatar: "avatar_url", location: "location", nickname: "nickname", token: "token"}}
  """
  def find_or_create(%Auth{} = auth) do
    {:ok, basic_info(auth)}
  end

  defp basic_info(auth) do
    %{
      id: auth.uid,
      name: auth.info.name,
      avatar: auth.info.urls.avatar_url,
      location: auth.info.location,
      nickname: auth.info.nickname,
      token: auth.credentials.token
    }
  end

end
