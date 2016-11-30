class QueriesController < ApplicationController
    
    def index
    end
    
    def one
        @query = Tool.find_by_sql( "SELECT p.projectName, c.ceremonyName, count(s.id) AS signCount, count(distinct(a.id)) AS awardCount, c.date FROM projects p, ceremonies c LEFT JOIN signs s ON c.id = s.ceremony_id LEFT JOIN ceremonyawards a ON c.id = a.ceremony_id WHERE p.id = c.project_id GROUP BY p.id") 
		if params[:search]
		    
		    @query = Project.find_by_sql( "SELECT p.projectName, c.ceremonyName, count(s.id) AS signCount, count(distinct(a.id)) AS awardCount, c.date FROM projects p, ceremonies c LEFT JOIN signs s ON c.id = s.ceremony_id LEFT JOIN ceremonyawards a ON c.id = a.ceremony_id WHERE p.id = c.project_id AND c.date LIKE '%#{params[:search]}%' GROUP BY p.id") 
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
        @query = Tool.find_by_sql( "SELECT o.organizationName, p.projectName, c.ceremonyName, DATEDIFF(c.date, p.startDate) AS dateDiff FROM c9.projects p, c9.organizations o, c9.ceremonies c WHERE o.id = p.id AND p.id = c.project_id;")
    end
    
    def four
        @query = Tool.find_by_sql( "SELECT p.projectName, count(r.id) as reportCount, IFNULL(sum(r.numVolunteers),0) AS sumVol, IFNULL(sum(r.totalHours),0) AS sumHours  FROM c9.projects p LEFT JOIN c9.reports r ON p.id = r.project_id GROUP BY p.id;")
    end
    
    def five
        @query = Tool.find_by_sql( "SELECT t.toolName, t.totalQuantity, t.description,  IFNULL(quantityRented, 0) AS quantityRented, IFNULL(quantityReturned,0) AS quantityReturned FROM  c9.tools t LEFT JOIN (SELECT t.id AS toolID, SUM(tc.quantityRented) AS quantityRented FROM c9.tools t LEFT JOIN c9.toolchecks tc ON t.id = tc.tool_id WHERE tc.approved = true AND tc.Type = '1' GROUP BY t.id) AS quantRented ON quantRented.toolID = t.id LEFT JOIN (SELECT t.id AS toolID, SUM(tc.quantityRented) AS quantityReturned FROM c9.tools t LEFT JOIN c9.toolchecks tc ON t.id = tc.tool_id WHERE tc.approved = true AND tc.Type = '2' GROUP BY t.id) AS quantReturned ON quantReturned.toolID = t.id;")
    end
    
    def six
        @query = Tool.find_by_sql( "Select id as siteID, subtype as subType, sitestreet as siteStreet,(case when subtype = 'street' then(select concat(miles,' miles') from streets where site_id = sites.id) when subtype = 'wash' then(select concat(Miles,' miles') from washes where site_id = sites.id) when subtype = 'park' then(select concat(Acres,' Acres') from parks where site_id = sites.id) end) as areaDetails from sites;")
    end
    
    def seven
        @query = Tool.find_by_sql( "SELECT v.firstName, v.lastName, r.reportedHours From volunteers v, regularmembers r Where v.id = r.volunteer_id ORDER BY reportedHours DESC LIMIT 5;")
        if params[:search]
		    @query = Tool.find_by_sql( "SELECT v.firstName, v.lastName, r.reportedHours From volunteers v, regularmembers r Where v.id = r.volunteer_id ORDER BY reportedHours DESC LIMIT #{params[:search]};") 
            @var = 1		
        end
    end
    
    def eight
        @query = Tool.find_by_sql( "SELECT er.organization_id AS organizationID, o.organizationName AS organizationName, er.cleanUpsDone AS cleanupsPerformed, er.cleanUpsRequired AS requiredCleanups, er.evalPeriodStart AS evaluationPeriodBeginDate,er.evalPeriodEnd AS evaluationPeriodEndDate, er.updated_at AS lastUpdateOn FROM evaluationreports er, organizations o WHERE o.id = er.organization_id;")
        if params[:beginday]
		    @query = Tool.find_by_sql( "SELECT er.organization_id AS organizationID, o.organizationName AS organizationName, er.cleanUpsDone AS cleanupsPerformed, er.cleanUpsRequired     AS requiredCleanups, er.evalPeriodStart AS evaluationPeriodBeginDate,er.evalPeriodEnd AS evaluationPeriodEndDate, er.updated_at AS lastUpdateOn FROM evaluationreports er, organizations o WHERE o.id = er.organization_id AND er.evalPeriodStart >= '#{params[:startyear]}-#{params[:beginmonth]}-#{params[:beginday]} 00:00:00' AND er.evalPeriodEnd <= '#{params[:endyear]}-#{params[:endmonth]}-#{params[:endday]} 00:00:00';") 
            @var = 1		
        end 
    end
    
    def nine
        @query = Tool.find_by_sql( "SELECT o.organizationName AS organizationName, count(distinct(p.id)) AS projectCount, count(distinct(st.id)) AS shortCount, count(distinct(c.id)) AS ceremonyCount, count(distinct(s.id)) AS signCount FROM organizations o LEFT JOIN projects p ON o.id = p.organization_id LEFT JOIN shorttermevents st ON o.id = st.organization_id LEFT JOIN ceremonies c ON p.id = c.project_id LEFT JOIN signs s ON c.id = s.ceremony_id GROUP BY o.organizationName;")
    end
    
    def ten
        @query = Tool.find_by_sql( "SELECT v.firstName AS firstName, v.lastName AS lastName, o.organizationName AS organizationName, mi.coordinatorTitle AS coordinatorTitle, DATEDIFF(mi.coordinatorEnd, mi.coordinatorStart) AS term FROM volunteers v JOIN groupcoordinators gc ON v.id = gc.volunteer_id LEFT JOIN managementinfos mi ON gc.volunteer_id = mi.volunteer_id LEFT JOIN organizations o ON o.id = mi.organization_id ORDER BY term desc;")
    end
    
end