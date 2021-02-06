#
# get node version from nvmrc
# works well with zsh-nvm and autoload
#
# TODO npm completion (maybe)
#
# Mostly stolen from zprezto
#

function node-info {

	local version
	local version_format
	local version_formatted

	unset node_info
	typeset -gA node_info

	if (( $+functions[nvm_version] )); then
  		version="${$(nvm_version)#v}"
	fi

	if [[ "$version" != (none|) ]]; then
  		zstyle -s ':prezto:module:node:info:version' format 'version_format'
  		zformat -f version_formatted "$version_format" "v:$version"
  		node_info[version]="$version_formatted"
	fi

}