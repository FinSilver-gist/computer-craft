-- Update script
-- Automatically downloads ComputerCraft programs to a computer
-- https://gist.github.com/[gist_user]/[gist_id]/raw/[file_name]

-- place name of file and url here, use url structure above
urls = {
    
}

function download(name, url)
  print("Updating " .. name)
 
  request = http.get(url)
  data = request.readAll()
 
  if fs.exists(name) then
    fs.delete(name)
    file = fs.open(name, "w")
    file.write(data)
    file.close()
  else
    file = fs.open(name, "w")
    file.write(data)
    file.close()
  end
 
  print("Successfully downloaded " .. name .. "\n")
end

for key, value in ipairs(urls) do
    download(unpack(value))
end

term.clear()
term.setCursorPos()