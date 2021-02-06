#
# java plugin, really a jenv one
#

# Load what needs to be loaded
if [[ -s "$HOME/.jenv/bin/jenv" ]]; then
    path=("$HOME/.jenv/bin" $path)
    eval "$(jenv init - --no-rehash zsh)"
fi

# move this to fpath?
function java-info {
    local version
    local version_format
    local version_formatted
    
    # Clean up previous $java_info.
    unset java_info
    typeset -gA java_info
    
    # Grab the styling we might have to do
    zstyle -s ':gilles:java:info:version' format 'version_format'
    if [[ -n "$version_format" ]]; then

        #only jenv, do nothing if system
        #would it be better to just detect a `.java-version` file?

        if (( $+commands[jenv] )); then
            version="${$(jenv version)%% *}"
        fi
        
        if [[ -n "$version" && "$version" != "system" && "$version" != $(jenv global) ]]; then
            zformat -f version_formatted "$version_format" "v:$version"
            java_info[version]="$version_formatted"
        fi
    fi
}
