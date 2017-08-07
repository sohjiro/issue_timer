defmodule IssueTimer.Core.UserFromAuthTest do
  use IssueTimer.DataCase
  doctest IssueTimer.Core.UserFromAuth


  test "Should create a new user from auth" do
    auth = %Ueberauth.Auth{ credentials: %Ueberauth.Auth.Credentials{token: "token"},
      info: %Ueberauth.Auth.Info{location: "location", name: "Some Name", nickname: "nickname", urls: %{avatar_url: "avatar_url"}},
      uid: 1111
    }

    {:ok, user} = IssueTimer.Core.UserFromAuth.find_or_create(auth)

    assert user.id
    assert user.uid == auth.uid
    assert user.name == auth.info.name
    assert user.avatar == auth.info.urls.avatar_url
    assert user.location == auth.info.location
    assert user.username == auth.info.nickname
    assert user.token == auth.credentials.token
  end

  test "Should find a registerd user from auth" do
    user = IssueTimer.Repo.insert!(%IssueTimer.User{uid: 1111, name: "Some Name", avatar: "avatar_url", location: "location", username: "nickname", token: "token"})
    auth = %Ueberauth.Auth{ credentials: %Ueberauth.Auth.Credentials{token: "token"},
      info: %Ueberauth.Auth.Info{location: "location", name: "Some Name", nickname: "nickname", urls: %{avatar_url: "avatar_url"}},
      uid: 1111
    }

    {:ok, current_user} = IssueTimer.Core.UserFromAuth.find_or_create(auth)

    assert current_user.id == user.id
    assert current_user.uid == user.uid
    assert current_user.name == user.name
    assert current_user.avatar == user.avatar
    assert current_user.location == user.location
    assert current_user.username == user.username
    assert current_user.token == user.token
  end

end
