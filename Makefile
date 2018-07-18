mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

upload : 
	gsutil -m rsync -n -d -r -x 'Makefile' ${current_dir} gs://bf-personal-website
	gsutil -m web set -m index.html -e index.html gs://bf-personal-website
	gsutil -m defacl ch -u AllUsers:R gs://bf-personal-website
	gsutil -m acl ch -u AllUsers:R gs://bf-personal-website/**
