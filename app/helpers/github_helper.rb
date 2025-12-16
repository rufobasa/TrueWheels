module GithubHelper
  def github_avatar_url(user)
    username = GITHUB_USERNAMES[user.email]
    return nil unless username

    "https://github.com/#{username}.png"
  end
end
