json.array!(@boards) do |board|
  json.extract! board, :id, :title, :public
  json.url board_url(board, format: :json)
end
