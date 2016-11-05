class QueriesController < ApplicationController
    
    def one
        @query = Sign.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count FROM c9.tools Group by tools.toolName")
        
    end
    
    def two
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count FROM c9.tools Group by tools.toolName")
    end
    
end