
EXCLUDED = ['Rakefile', 'Brewfile', 'Caskfile', 'prezto-custom']

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
    `git submodule update --init --recursive`
  end
end

desc 'Init Prezto'
task :init_prezto do

  link = File.join(ENV['HOME'], ".zprezto", "modules", "prompt", "functions", "prompt_gilles_setup")
  if not File.exists?(link)
    File.symlink(File.join(DOTFILES_PATH, 'prezto-custom', 'prompt_gilles_setup'), link)
  end

  Dir[File.join(ENV['HOME'], '.zprezto', 'runcoms', '*')].each do |source|
    base = File.basename(source)
    link = File.join(ENV['HOME'], ".#{base}")
    next if File.exists?(link)
    if source != "README.md" && source != 'zprestorc'
      File.symlink(source, link)
    end
  end

end


desc 'Install dot files.'
task :install => [:init, :symlink, :init_prezto] do
end

task :default => [:install]
