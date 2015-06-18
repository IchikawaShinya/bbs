json.array!(@thread_boards) do |thread_board|
  json.extract! thread_board, :id
  json.url thread_board_url(thread_board, format: :json)
end
