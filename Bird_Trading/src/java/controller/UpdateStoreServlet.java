package controller;

import DAO.ProductDAO;
import DAO.StoreDAO;
import DTO.ProductDTO;
import DTO.StoreDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

public class UpdateStoreServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");

            StoreDTO p = new StoreDTO();
            String filename = null;

            String productId = null;
            String storeId = null;

            String imagepath = null;
            double price = 0;
            int quantity = 0;
            String image = null;
            int categoryId = 0;

            StoreDAO dao = new StoreDAO();
            List<StoreDTO> orderList = dao.getAllStores();
            if (action == null || action.equals("")) {
                request.setAttribute("orders", orderList);
                request.getRequestDispatcher("storePage.jsp").forward(request, response);
            }
            HttpSession session = request.getSession();
            switch (action) {

                case "edit":
                    int storeIdInt = Integer.parseInt(request.getParameter("storeId"));
                    storeId = String.valueOf(storeIdInt);
//                    storeId = "2";
                    p = dao.getStoreByIdStore(storeId);

                    System.out.println("Store ID: " + p.getStore_id());
                    System.out.println("Store Name: " + p.getStore_name());
                    System.out.println("Address: " + p.getAddress());
                    System.out.println("Phone Number: " + p.getPhone_number());
                    System.out.println("User ID: " + p.getUser_id());
                    System.out.println("Image: " + p.getImage());

                    session.setAttribute("INFOR", p);
                    session.setAttribute("ACTION", "Save");
                    request.getRequestDispatcher("updateStore.jsp").forward(request, response);
                    break;

                case "Save":
                    
                    try {
                    // Đặt encoding cho request thành UTF-8
                    request.setCharacterEncoding("UTF-8");

                    // Create a factory for disk-based file items
                    DiskFileItemFactory factory = new DiskFileItemFactory();

                    // Configure a repository (to ensure a secure temp location is used)
                    ServletContext servletContext = this.getServletConfig().getServletContext();
                    File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                    factory.setRepository(repository);

                    // Create a new file upload handler
                    ServletFileUpload upload = new ServletFileUpload(factory);

                    // Parse the request
                    List<FileItem> items = upload.parseRequest(request);

                    // Process the uploaded items
                    Iterator<FileItem> iter = items.iterator();
                    HashMap<String, String> fileds = new HashMap();
                    String existingImagePath = null;
                    while (iter.hasNext()) {
                        FileItem item = iter.next();

                        if (item.isFormField()) {
                            // Đặt encoding cho giá trị tiếng Việt

                            fileds.put(item.getFieldName(), item.getString());
                            String name = item.getFieldName();
                            String value = new String(item.getString().getBytes("ISO-8859-1"), "UTF-8");
                            //    String value = item.getString();
                            System.out.println("name " + name);
                            System.out.println("value " + value);
                        } else {
                            String fileName = item.getName();

                            if (fileName != null && !fileName.isEmpty()) {

                                String uploadPath = getServletContext().getRealPath("/") + "images/";
                                filename = item.getName();

                                File file = new File(uploadPath, filename);
                                //   filenamecheck = filename;
                                //    System.out.println("file name" + uploadedFile);

                                // Kiểm tra xem tệp tin đã tồn tại trong thư mục hay không
                                if (file.exists()) {
                                    // Xử lý trường hợp trùng lặp, ví dụ: đổi tên tệp tin
                                    String baseName = FilenameUtils.getBaseName(filename);
                                    String extension = FilenameUtils.getExtension(filename);
                                    int counter = 1;

                                    // Lặp để tạo tên mới cho tệp tin
                                    while (file.exists()) {
                                        filename = baseName + "_" + counter + "." + extension;
                                        file = new File(uploadPath, filename);
                                        counter++;
                                    }
                                }
                                item.write(file);
                                imagepath = "images/" + filename;
                                System.out.println("d  " + filename);
                            }
                        }
                    }
                    // Lấy giá trị tiếng Việt từ trường dữ liệu "productName"
                    String storeName = new String(fileds.get("storeName").getBytes("ISO-8859-1"), "UTF-8");

                    // Lấy giá trị tiếng Việt từ trường dữ liệu "description"
                    String adresss = new String(fileds.get("adresss").getBytes("ISO-8859-1"), "UTF-8");

                    storeId = fileds.get("storeId");
                    p = dao.getStoreByIdStore(storeId);

                    if (p == null) {
                        System.out.println("trung");
                    } else {
                        System.out.println("ze");
                        StoreDTO storedto = new StoreDTO();
                        storedto.setStore_id(fileds.get("storeId"));
                        storedto.setStore_name(storeName);
                        storedto.setPhone_number(fileds.get("phone"));
                        storedto.setAddress(adresss);
                        storedto.setUser_id(Integer.parseInt(fileds.get("userId")));

                        if (imagepath == null || imagepath.trim().equals("")) {
                            System.out.println("no khong chay");
                        } else {
                            // Sử dụng đường dẫn ảnh mới
                            storedto.setImage(imagepath);
                            System.out.println("no chay kia");
                        }
//                        
                        boolean a = dao.updateStore(storedto);
                        System.out.println("luu");

                    }

                } catch (Exception e) {
                }

                session.setAttribute("INFOR", p);
                request.getRequestDispatcher("updateStore.jsp").forward(request, response);
//                request.getRequestDispatcher("storePage.jsp").forward(request, response);
                break;

            }

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStoreServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateStoreServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStoreServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateStoreServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
