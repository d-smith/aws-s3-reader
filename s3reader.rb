require File.expand_path(File.dirname(__FILE__) + '/config')

def findObject(bucket, key)
  bucket.objects.each do |object|
    if(object.key == key)
      return object
    end
  end

  raise "object with key #{key} not found"
end

bucket = AWS::S3::Bucket.new('xt-client-mapping')

obj = findObject(bucket, 'mapping.json')

obj.read do |chunk|
  puts chunk
end
