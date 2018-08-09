<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bean.Calling_system_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>

<p style="text-align: right; position: absolute; top: 80px; left: 30px; color: #666; display: block; font-weight: 500; font-size: 24px;"><%

    String hfccd = "-";
    String discp = "-";
    String subdi = "-";
    String lang = "-";
    String initial = "-";
    String filterType = (String) session.getAttribute("CS_PARAM");
    Conn conn = new Conn();
    try {
        hfccd = request.getParameter("hfccd");
        discp = request.getParameter("discp");
        subdi = request.getParameter("subdi");
        lang = request.getParameter("lang");
        initial = request.getParameter("initial");

    } catch (Exception e) {
    }

    String hfccd_str = "";
    if (hfccd != "") {
        hfccd_str = " cs_hfc_cd = '" + hfccd + "'";
    }
    String discp_str = "";
    if (discp != "") {
        discp_str = " AND cs_discipline = '" + discp + "'";
    }
    String subdi_str = "";
    if (subdi != "") {
        subdi_str = " AND cs_sub_discipline = '" + subdi + "'";
    }

    String sql = "SELECT Id,cs_patient_name,cs_queue_no,cs_queue_name,cs_callingtime,cs_room_no FROM qcs_calling_system_queue";
    String fullSql = "";
    if (filterType.equalsIgnoreCase("0")) {
        fullSql = sql + " WHERE " + hfccd_str + discp_str + subdi_str + " and cs_callingtime > 0 and date(cs_datetime) = date(curdate()) order by id asc limit 1";
    } else {
        fullSql = sql + " WHERE " + hfccd_str + discp_str + " and cs_callingtime > 0 and date(cs_datetime) = date(curdate()) order by id asc limit 1";
    }
    Query q = new Query();
    //ArrayList<Calling_system_bean> d = q.getQueryCallingSystem(sql);
    ArrayList<ArrayList<String>> d = conn.getData(fullSql);

    Date datenow = new Date();
    SimpleDateFormat tarikh = new SimpleDateFormat("dd/MM/YYYY");
    SimpleDateFormat masa = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formate = new SimpleDateFormat("a");

    %></p>
<p style="text-align: right; position: fixed; top: 20px; right: 30px; color: #666; display: none; font-weight: 500; font-size: 40px; ">
    <span style="display: block; font-size: 26px; letter-spacing: .14em; margin-bottom: -10px; font-weight: 300;"><%out.print(tarikh.format(datenow));%></span>
    <%out.print(masa.format(datenow));%>&nbsp;<%out.print(formate.format(datenow));%>
</p>

<div id="callerTable">
    <%            if (d.size() > 0) {
            for (int i = 0; i < d.size(); i++) {
                String cs_id = d.get(i).get(0);
                String number = d.get(i).get(4);
                int cs_callingtime = Integer.parseInt(number);
    %>

    <div class="calling-queueNo active">
        <h3 style="font-size: 20px;margin: 10px 0 0;">Queue No.</h3>
        <h1 class="q-pantone" id="qno_<%=i%>" style="font-size: 100%;margin: 0px;"><%=d.get(i).get(2)%></h1>
        <dt id="name_<%=i%>" style="font-size: 15px;">(<%=d.get(i).get(1)%>)</dt>
        <h4 style="font-size: 20px;margin: 0px;">Room No: <span class="q-pantone" id="qname_<%=i%>"><%=d.get(i).get(5)%></span></h4>
        <%
            String myString = d.get(i).get(2);
        %>
        <div id="view_VS"></div>
        <% //String LNG = request.getParameter("LNG");

            if (cs_callingtime > 0) {
                if (lang.equals("1")) {
        %>
        <script>
            var initial = "<%=initial%>";
            var name = $("#name_<%=i%>").html();
            name = name.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });

            var qno = $("#qno_<%=i%>").html();
            //console.log(qno);
            var qname = $("#qname_<%=i%>").html();
            qname = qname.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });
            //$("#view_VS").load("libraries/header.html");
            //alert(qno);
            var qno1 = Number(qno) + Number(initial);
            //alert(qno);
            $("#view_VS").load("voice_call.jsp?idResult=" + qno1 + "&room=" + qname);
            //console.log(qno1);
            //console.log(qname);
        </script>   
        <%
        } else if (lang.equals("2")) {
        %>
        <script>
            var name = $("#name_<%=i%>").html();
            name = name.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });

            var qno = $("#qno_<%=i%>").html();
            var qname = $("#qname_<%=i%>").html();
            qname = qname.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });
            var ayat = name;

            var msg1 = new SpeechSynthesisUtterance(ayat);
            window.speechSynthesis.speak(msg1);
        </script>
        <%
        } else if (lang.equals("3")) {
        %>
        <script>
            var name = $("#name_<%=i%>").html();
            name = name.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });

            var qno = $("#qno_<%=i%>").html();
            var qname = $("#qname_<%=i%>").html();
            qname = qname.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                return letter.toUpperCase();
            });
            var ayat = name + ", Number " + qno + ", Room " + qname;
            var msg1 = new SpeechSynthesisUtterance(ayat);
            window.speechSynthesis.speak(msg1);
        </script>
        <%
            }
        %>

        <%
            RMIConnector rmic = new RMIConnector();
            //Query q2 = new Query();
            cs_callingtime -= 1;
            String sql2 = "UPDATE qcs_calling_system_queue SET cs_callingtime = '" + cs_callingtime + "' WHERE Id = '" + cs_id + "' ";
            //q2.setQuery(sql2);
            rmic.setQuerySQL(conn.HOST, conn.PORT, sql2);
        } else {
        %>
        <script>
            //alert("habis");
        </script>
        <%
            }
        %>
        <div>
            <input type="hidden" value="<%=d.get(i).get(0)%>" id="idCaller">
            <button class="btn btn-link" id="delCaller"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
<script>
    $('#callerTable #delCaller').on('click', function () {
        var row = $(this).closest('.queue-no');
        var idCaller = row.find('#idCaller').val();
        console.log(idCaller);
        bootbox.confirm({
            message: "Are you sure want to DELETE PATIENT CALLING?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                //if true go to PMI page
                if (result === true) {


                    $.ajax({
                        type: "post",
                        url: "delCaller.jsp",
                        data: {id: idCaller},
                        success: function (databack) {
                            console.log(databack);
                            if ($.trim(databack) === "success") {
                                bootbox.alert("success");
                            } else if ($.trim(databack) === "error") {
                                bootbox.alert("fail");
                            }

                        }
                    });
                }
            }
        });

    });
</script>
