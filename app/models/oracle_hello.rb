class OracleHello < ActiveRecord::Base
    
  self.table_name = "mz.v_wares"
  #self.establish_connection "oracle_production"
  
  def self.question(filter)
    "select * from
    (select 
  from
    
  where
     "
    
  end
  
  def self.question_code_wares(code_wares)
    "select * from
    (select 
  from
    
    from
           
  "
    
  end
  #self.primary_key = "idkeymz"
  # attr_accessible :title, :body
end
