def prompt(message)
  Kernel.puts("=> #{message}")
end

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

loop do
  prompt("Hello there #{name}")
end
