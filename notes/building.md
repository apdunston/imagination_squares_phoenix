 

 duckduckgo: authentication phoenix elixir
 https://powauth.com/


 {:pow,"~> 1.0.0"}

mix phx.gen.context Worlds Drawing drawings user_id:integer name:string content:map

mix phx.gen.html Worlds Drawing drawings name:string content:map --no-context --no-schema