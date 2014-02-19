require 'benchmark'
namespace :bench do
  task writes: :environment do
    Benchmark.bmbm do |x|
      x.report("Using Taggable") do 
        1_000.times do
          ArticleTaggable.create(:title => ('a'..'z').to_a.shuffle[0,8].join, :body => ('a'..'z').to_a.shuffle[0,100].join, :tag_list => ['TAG1'])
        end
      end
      x.report("Using Postgres Arrays") do
        1_000.times do
          ArticlePa.create(:title => ('a'..'z').to_a.shuffle[0,8].join, :body => ('a'..'z').to_a.shuffle[0,100].join, :tags => ['TAG1'])
        end
      end
    end    
  end

  task reads: :environment do
    Benchmark.bmbm do |x|
      x.report("Using Taggable") do 
        1_000.times do
          ArticleTaggable.includes(:tags).find_by_id(Random.new.rand(1000..2000));
        end
      end
      x.report("Using Postgres Arrays") do 
        1_000.times do
          ArticlePa.find_by_id(Random.new.rand(1000..2000));
        end
      end      
    end     
  end
end