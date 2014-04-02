
# every 1.day, :at => '5am' do
every 1.hour do
  rake "auto_delete"
end
