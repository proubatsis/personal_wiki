defmodule PersonalWiki.Repo do
  use Ecto.Repo,
    otp_app: :personal_wiki,
    adapter: Ecto.Adapters.Postgres
end
