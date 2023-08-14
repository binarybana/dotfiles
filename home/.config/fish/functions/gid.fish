function gid --wraps='git diff --cached' --description 'alias gid=git diff --cached'
  git diff --cached $argv; 
end
