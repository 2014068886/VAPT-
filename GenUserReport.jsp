<%-- 
    Document   : GenUserReport
    Created on : Jul 31, 2017, 1:30:28 PM
    Author     : JMB
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import = "com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.io.*, java.sql.*, javax.servlet.ServletException, com.mysql.jdbc.Statement, javax.servlet.http.*, java.text.SimpleDateFormat, java.time.LocalDate, java.util.Date" %>
        <%
            Font headerFontBold = new Font(Font.FontFamily.UNDEFINED,14,Font.BOLD);
	    	Font headerFont = new Font(Font.FontFamily.UNDEFINED,12);
	    	Font titleFont = new Font(Font.FontFamily.UNDEFINED,12,Font.BOLD);
	    	LocalDate localDate = LocalDate.now();
	    	String output = ""+  new SimpleDateFormat("MM-dd-yyyy HH-mm-ss").format(new Date()) ;
			Document document = new Document();
			 
			try
			 {
		            PdfWriter.getInstance(document,new FileOutputStream("C:\\Users\\JMB\\Desktop\\Users Report"+output+".pdf"));
		            document.open();

		            PdfPTable table = new PdfPTable(3);
		            table.setWidths(new float[] { 25, 50, 25});
		            table.setWidthPercentage(100);
		            
		            Image image = Image.getInstance("Landbank.png");
		            image.scaleAbsoluteHeight(75);
		            image.scaleAbsoluteWidth(75);
		            PdfPCell cell = new PdfPCell(image);
		            cell.setBorder(Rectangle.NO_BORDER);
		            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		            table.addCell(cell);
		   
		            Paragraph para1 = new Paragraph("LAND BANK OF THE PHILIPPINES", headerFontBold);
		            para1.setSpacingAfter(2);
		            para1.setAlignment(Paragraph.ALIGN_CENTER);

		            Paragraph para2 = new Paragraph("1598 M.H del Pilar corner Dr. J. Quintos Sts., Malate, Manila", headerFont);
		            para2.setSpacingAfter(2);
		            para2.setAlignment(Paragraph.ALIGN_CENTER);
		            
		            Paragraph para3 = new Paragraph("Users Monitoring Report", headerFont);
		            para3.setSpacingAfter(5);
		            para3.setAlignment(Paragraph.ALIGN_CENTER);
		            
		            Paragraph para7 = new Paragraph("Generated as of : " +  new SimpleDateFormat("MM-dd-yyyy HH:mm:ss").format(new Date()), headerFont);
		            para7.setAlignment(Paragraph.ALIGN_CENTER);
		            para7.setSpacingAfter(20);
		            
		            PdfPCell cell1 = new PdfPCell();
		            cell1.setBorder(Rectangle.NO_BORDER);
		            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		            cell1.addElement(Chunk.NEWLINE);
		            cell1.addElement(para1);
		            
		            cell1.addElement(para2);
		            
		            cell1.addElement(para3);
		            cell1.addElement(para7);
		            table.addCell(cell1);
		                   
		            document.add(table);
		            
		            Paragraph para4 = new Paragraph("Monitoring Report for All Users: ", titleFont);
		            para4.setAlignment(Paragraph.ALIGN_LEFT);
		            para4.setSpacingAfter(2);
		            document.add(para4);
		            
		            Paragraph para5 = new Paragraph("Generated by:  ", titleFont);
		            para5.setAlignment(Paragraph.ALIGN_LEFT);
		            para5.setSpacingAfter(8);
		            document.add(para5);
					try
					{
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection  con=(Connection) DriverManager.getConnection ("jdbc:mysql://localhost:3306/landbank","root","12345");
							String query = "select * from users";
							Statement st = (Statement) con.createStatement();
							ResultSet rs = st.executeQuery(query);
	           
			                PdfPTable recordTable = new PdfPTable(8);
			                recordTable.setWidthPercentage(100);
			                
			                PdfPCell recordCell;
			                
			                recordCell=new PdfPCell(new Phrase("User ID"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
			                
			                recordCell=new PdfPCell(new Phrase("Team Name"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
			                
			                recordCell=new PdfPCell(new Phrase("User Type"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
			                
			                recordCell=new PdfPCell(new Phrase("Username"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
			                
			                recordCell=new PdfPCell(new Phrase("First Name"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
			                
			                recordCell=new PdfPCell(new Phrase("Last Name"));
			                recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                recordTable.addCell(recordCell);
                                        
                            recordCell=new PdfPCell(new Phrase("Address"));
                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            recordTable.addCell(recordCell);
			                
                            recordCell=new PdfPCell(new Phrase("Mobile Number"));
                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            recordTable.addCell(recordCell);
                                        
                            recordCell=new PdfPCell(new Phrase("Phone Number"));
                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            recordTable.addCell(recordCell); 
                                        
                            recordCell=new PdfPCell(new Phrase("Email Address"));
                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                            recordTable.addCell(recordCell);
                                        
			                while(rs.next())
			                {
			                
			                	String id = rs.getString("");
			                	String team = rs.getString("");
			                	String type = rs.getString("");
			                	String username = rs.getString("");
			                	String fname = rs.getString("");
			                 	String lname = rs.getString("");
			                	String address = rs.getString("");
                                                String mobileNum = rs.getString("");
                                                String phoneNum = rs.getString("");
                                                String email = rs.getString("");
                                                
			                    recordCell=new PdfPCell(new Phrase(id));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                    
			                    recordCell=new PdfPCell(new Phrase(team));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                    
			                    recordCell=new PdfPCell(new Phrase(type));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                    
			                    recordCell=new PdfPCell(new Phrase(username));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                    
			                    recordCell=new PdfPCell(new Phrase(fname));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                   
			                    recordCell=new PdfPCell(new Phrase(lname));
			                    recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
			                    recordTable.addCell(recordCell);
			                   
                                            recordCell=new PdfPCell(new Phrase(address));
                                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                                            recordTable.addCell(recordCell);
                                            
                                            recordCell=new PdfPCell(new Phrase(mobileNum));
                                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                                            recordTable.addCell(recordCell);
                                            
                                            recordCell=new PdfPCell(new Phrase(phoneNum));
                                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                                            recordTable.addCell(recordCell);
                                            
                                            recordCell=new PdfPCell(new Phrase(email));
                                            recordCell.setHorizontalAlignment(Element.ALIGN_CENTER);
                                            recordTable.addCell(recordCell);
                                            
			                }
			                document.add(recordTable);
			                rs.close();
			                st.close();
			                con.close();
			                document.close();
					} catch (Exception e)
					{
						e.printStackTrace();
					}
				}catch(Exception e)
			 	{
					e.printStackTrace();
			 	}
				response.sendRedirect("VAPT_AdminUsers.jsp");
            %>
    </body>
</html>