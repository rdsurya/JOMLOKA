/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PIS_helper;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.DottedLineSeparator;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.WordUtils;

/**
 *
 * @author Shammugam
 */
@WebServlet(name = "testing1", urlPatterns = {"/testing1"})

public class testing1 extends HttpServlet {

    // Declaring Variable
    public String labelData = "";

    /**
     * @see HttpServlet#doGet( HttpServletRequest request, HttpServletResponse
     * response)
     */
    // Function To Generate Label
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");

        try {

            // Getting Long Data For The Label Generation And Spliting The Data
            labelData = request.getParameter("labelData");
            String splittedMainData[] = labelData.split("\\<split>", -1);

            // Setting Page Size And PDF Writter
            Document document = new Document(PageSize.A8, 5, 10, 10, 5);
            PdfWriter.getInstance(document, response.getOutputStream());

            // Initialiase The PDF Document
            document.open();

            // Loop To Generate The Label
            for (int i = 0; i < splittedMainData.length; i++) {

                String splittedDetailData = splittedMainData[i];

                // Initializing New Page
                document.newPage();
                // Initializing New Page

                // Rectangle For Border
                Rectangle labelRectBorder = new Rectangle(144, 5, 4, 205);
                labelRectBorder.setBorder(Rectangle.BOX);
                labelRectBorder.setBorderWidth(2);
                document.add(labelRectBorder);
                // Rectangle For Border

                document.add(new Paragraph(splittedDetailData));

            }

            // step 5
            document.close();

        } catch (Exception de) {
            throw new IOException(de.getMessage());
        }
    }

}
