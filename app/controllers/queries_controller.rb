class QueriesController < ApplicationController
    
    def index
    end
    
    def one
        @query = Sign.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count FROM c9.tools Group by tools.toolName")
    end
    
    def two
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def three
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def four
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def five
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def six
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def seven
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def eight
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def nine
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
    def ten
        @query = Tool.find_by_sql( "SELECT tools.toolName, SUM(tools.totalQuantity) AS Count, tools.description FROM c9.tools Group by tools.toolName")
    end
    
end