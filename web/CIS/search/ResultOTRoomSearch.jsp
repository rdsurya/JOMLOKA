

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    

    //String key ="bypass";
    String searchProblem = "select room_no,room_name from opt_room WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline+"' AND `subdiscipline_cd` = '"+subdicipline+"';";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + " - " +search.get(i).get(1)+ "\", "
                        + "\"value\" : \"" + search.get(i).get(1) + "\"}"
                );
            } else {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + " - " +search.get(i).get(1)+ "\", "
                        + "\"value\" : \"" + search.get(i).get(1) + "\"},"
                );
            }
        }
        out.print("]");
    }
%>
