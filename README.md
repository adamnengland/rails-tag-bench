rails-tag-bench
===============

Benchmarking Acts-As-Taggable-On vs Postgres Arrays for tagging.

To get started:

git clone git@github.com:adamnengland/rails-tag-bench.git
bundle install
rake db:create
rake db:migrate
rake bench:writes
rake bench:reads
