require 'uri'
require 'open3'

system("bundle exec bitclust setup --versions=2.1.0")
keywords =[]
Open3.popen3("bundle exec bitclust list --method") do |i, o, e, w|
  o.each do |line|
    line =~ /^.+[#.]([a-zA-Z0-9_?!]+)$/
    keyword = $1
    keywords.push(keyword)
  end
end

dict = ""
keywords.each do |line|
end.select do |name|
  name and name.size > 2
end.sort.uniq.each do |name|
  dict = dict + name.strip + "\n"
end
open('./dict/ruby.dict', 'w'){|f| f.write(dict)}
