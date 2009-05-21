#!/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')


Dir['*'].each do |file|
  # skip if install.rb or README
  next if file =~ /install|README/

  symfile = ".#{file}"
  target = File.join(home, symfile)

  # setup backup directory
  backup = File.join(home, ".olddotfiles")
  `mkdir -p #{backup}`
  
  # backup the file if it exists and it's not a symlink
  `mv #{target} #{File.join(backup, symfile)}` if File.exist?(target) and !File.symlink?(target)
  
  # create a symbolic link
  `ln -s #{File.expand_path file} #{target}`
end

# git push on commit
`echo 'git push' > .git/hooks/post-commit`
`chmod 755 .git/hooks/post-commit`
