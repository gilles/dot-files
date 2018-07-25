
SCRIPT_PATH = File.expand_path(__FILE__)
DOTFILES_PATH = File.dirname(SCRIPT_PATH)

desc 'Symlink home files'
task :symlink do
  EXCLUDED = ['Rakefile', 'zsh', 'nvim']
  Dir["./*"].each do |source|
    base = File.basename(source)
    link = File.join(ENV['HOME'], ".#{base}")
    next if EXCLUDED.include?(base) or File.exists?(link)
    next if File.identical?(base, link)
    puts "Linking #{base}"
    File.symlink(File.join(DOTFILES_PATH, source), link)
  end
end

dec 'Setup neovim'
task :neovim do
  system 'mkdir', '-p', '~/.config'
  link = File.join(ENV['HOME'], ".config", "nvim")
  File.symlink(File.join(DOTFILES_PATH, 'nvim'), link)
end

desc 'Install dot files.'
task :install => [:symlink, :neovim] do
end

task :default => [:install]
