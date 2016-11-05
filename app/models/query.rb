class Query < ActiveRecord::Base 
    
    def self.with_tool_count
    query = <<-SQL
    SELECT tools.toolName, SUM(tools.totalQuantity) AS Count
    FROM tools
    Group by tools.toolName
    SQL

    end
    
end