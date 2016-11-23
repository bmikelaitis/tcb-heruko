class QueriesController < ApplicationController
    
    def index
    end
    
    def one
        @query = Tool.find_by_sql( "SELECT p.projectName, c.ceremonyName, count(s.id) AS signCount, count(distinct(a.id)) AS awardCount, c.date FROM projects p, ceremonies c LEFT JOIN signs s ON c.id = s.ceremony_id LEFT JOIN ceremonyawards a ON c.id = a.ceremony_id WHERE p.id = c.project_id GROUP BY c.ceremonyName, p.projectName") 
		if params[:search]
		    
		    @query = Project.find_by_sql( "SELECT p.projectName, c.ceremonyName, count(s.id) AS signCount, count(distinct(a.id)) AS awardCount, c.date FROM projects p, ceremonies c LEFT JOIN signs s ON c.id = s.ceremony_id LEFT JOIN ceremonyawards a ON c.id = a.ceremony_id WHERE p.id = c.project_id AND c.date LIKE '%#{params[:search]}%' GROUP BY c.ceremonyName, p.projectName") 
            @var = 1		
		end
    end
    
    def two
        @query = Tool.find_by_sql( "SELECT s.subtype, s.siteStreet, s.siteCounty, s.siteZip,  count(distinct(p.id)) AS projectCount, count(st.id) AS shortCount, count(distinct(p.id)) + count(st.id) AS totalSum FROM sites s LEFT JOIN shorttermevents st ON s.id = st.site_id LEFT JOIN projects p ON s.id = p.site_id GROUP BY s.id;") 
		if params[:search]
		    
		    @query = Project.find_by_sql( "SELECT s.subtype, s.siteStreet, s.siteCounty, s.siteZip,  count(distinct(p.id)) AS projectCount, count(st.id) AS shortCount, count(distinct(p.id)) + count(st.id) AS totalSum FROM sites s LEFT JOIN shorttermevents st ON s.id = st.site_id LEFT JOIN projects p ON s.id = p.site_id WHERE s.subtype = '#{params[:search]}' GROUP BY s.id;") 
            @var = 1		
		end
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