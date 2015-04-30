excludes = vcat([["--exclude", strip(x)] for x in readlines(open(expanduser("~/hli/exclude")))]...)

cd(ENV["HOME"]) do
  run(`duplicity --s3-use-rrs --no-encryption --s3-use-new-style --progress --dry-run $excludes hli s3://s3-us-west-2.amazonaws.com/hli-bix-us-west-2/jknight/backups`)
end
