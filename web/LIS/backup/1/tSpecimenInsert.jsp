<%@page import="java.util.Calendar"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    if (request != null && request.getContentType() != null) {
        int number = Integer.parseInt(request.getParameter("Total"));
        String C_date = request.getParameter("C_date");
        String C_time = request.getParameter("C_time");
        String pmi = request.getParameter("Pmi");
        String patient_name = request.getParameter("patient_name");
        
        String orderno1 = request.getParameter("Order_no");
        String[] Specimen = request.getParameterValues("Specimen[]");
        //String[] item_cd = request.getParameterValues("item_cd[]");
        String status = "Test Not Available Yet";
        String test = "Waiting for Approval";
        //int test = Integer.parseInt(number);
    
        RMIConnector rmic = new RMIConnector();
        Conn conn = new Conn();
        
//        String max  = "SELECT MAX(specimen_no) FROM lis_specimen";
//        ArrayList<ArrayList<String>> q4 = conn.getData(max);
//        int get1 = Integer.parseInt(q4.get(0).get(0));	
//        int result = get1+1;
       
        int year = Calendar.getInstance().get(Calendar.YEAR);
        String count1 = "SELECT CONCAT('SPE',LPAD(SUBSTRING(COALESCE(MAX(specimen_no),'SPE000'),4,4)+1,4,'0'))FROM lis_specimen";
        ArrayList<ArrayList<String>> result = conn.getData(count1);
        
        for(int i=0;i<number;i++)
        {
            
           
            String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            
            String sqlInsert = "INSERT INTO lis_specimen(specimen_no,order_no,pmi_no,hfc_cd,item_cd,Collection_date,Collection_time,specimen_status,patient_name,receive_specimen_status) VALUES ('"+result.get(0).get(0)+"','"+orderno1+"','"+pmi+"','"+hfc_cd+"','"+Specimen[i]+"','"+C_date+"','"+C_time+"','"+status+"','"+patient_name+"','"+test+"')";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
            
            String sqlInsert1 = "UPDATE lis_order_detail SET specimen_status = 'Test Not Available Yet',Verification = 'Wait for Assign Specimen',detail_status='1' WHERE order_no = '"+orderno1+"' AND item_cd = '"+Specimen[i]+"'";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert1);
            
            String sqlInsert2 = "UPDATE lis_order_master SET order_status = '1',billing_status = '0'  WHERE order_no = '"+orderno1+"'";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert2);
        }
        
        
}
    
    
    
    
    
  
%>