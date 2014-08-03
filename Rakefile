
EXCLUDED = ['Rakefile', 'Brewfile', 'Caskfile']

SCRIPT_PATH = File.expand_path(__FILE__)
DOTFILES_PATH = File.dirname(SCRIPT_PATH)

desc 'Symlink dot files.'
task :symlink do
  Dir["./*"].each do |source|
    base = File.basename(source)
    link = File.join(ENV['HOME'], ".#{base}")
    next if EXCLUDED.include?(base) or File.exists?(link)
    next if File.identical?(base, link)
    puts "Linking #{base}"
    File.symlink(File.join(DOTFILES_PATH, source), link)
  end
end

desc 'Init submodules.'
task :init do
  if File.exists? '.gitmodules'
    `git submodule init && git submodule update`
  end
end


desc 'Install dot files.'
task :install => [:init, :symlink] do
end

task :default => [:install]
