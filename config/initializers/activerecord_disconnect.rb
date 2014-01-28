#disconnect primary database
if defined?(ActiveRecord::Base)
 #ActiveRecord::Base.remove_connection
end