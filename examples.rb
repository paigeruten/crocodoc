# Upload a file from the disk
Crocodoc.upload(File.open("your-file.pdf", "r"))
    #=> {:shortId=>"Ni2Af", :uuid=>"34b17ba7-5035-46d5-f69a-457abbe69cd7"}

# Upload a file from a certain URL
Crocodoc.upload("http://example.com/your-file.pdf")
    #=> {:shortId=>"Ni2Af", :uuid=>"34b17ba7-5035-46d5-f69a-457abbe69cd7"}

# Upload a file with all the options
Crocodoc.upload(File.open("your-file.pdf", "r"), :title => "My File", :async => true, :private => true)
    #=> {:shortId=>"Ni2Af", :uuid=>"34b17ba7-5035-46d5-f69a-457abbe69cd7"}

# Check the conversion status of a document
Crocodoc.status(uuid)
    #=> [{:status=>"AVAILABLE", :viewable=>true, :uuid=>"34b17ba7-5035-46d5-f69a-457abbe69cd7"}]

# Check the conversion status of many documents
Crocodoc.status(uuid_1, uuid_2)
    #=> [{:status=>"AVAILABLE", :viewable=>true, :uuid=>"34b17ba7-5035-46d5-f69a-457abbe69cd7"},
         {:status=>"AVAILABLE", :viewable=>true, :uuid=>"74b17ba7-5035-46d5-f69a-457abbe69cd3"}]

# Delete an uploaded file
Crocodoc.delete(uuid)
    #=> true

# Download an uploaded file
File.open("your-file.pdf", "wb") do |f|
  f << Crocodoc.download(uuid, :annotated => true)
end

# Create a new "short ID" that can be used to share a document
Crocodoc.share(uuid, :editable => true)
    #=> {:shortId=>"Ni2Af"}

# Get a new session ID for session-based document viewing
Crocodoc.get_session(uuid)
    #=> {:sessionId=>"2FifJqejGtcR53c"}

# Get a new session ID, with all the options
Crocodoc.get_session(uuid, :downloadable => true, :editable => true, :name => "Jeremy Ruten")
    #=> {:sessionId=>"2FifJqejGtcR53c"}