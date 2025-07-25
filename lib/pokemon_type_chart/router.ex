defmodule PokemonTypeChart.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  get "/types/" do
    PokemonTypeChart.Controller.get_types(conn)
  end

  get "/type-charts" do
    PokemonTypeChart.Controller.get_type_charts(conn)
  end

  post "/pokemon/type-charts" do
    PokemonTypeChart.Controller.get_pokemon_type_charts(conn)
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
