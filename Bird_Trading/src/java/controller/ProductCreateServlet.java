package controller;

import DAO.ProductDAO;
import DAO.StoreDAO;
import DTO.ProductDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.math.BigDecimal;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

@MultipartConfig
public class ProductCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {
            // Khởi tạo đối tượng ServletFileUpload và cấu hình thư mục lưu trữ tạm thời
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(factory);

            String existingImagePath = null;
            String imagepath = null;

            try {
                // Phân tích các trường dữ liệu và tệp tin đính kèm từ request
                List<FileItem> items = fileUpload.parseRequest(request);

                // Tạo đối tượng ProductDTO để lưu trữ thông tin sản phẩm
                ProductDTO product = new ProductDTO();

                // Lặp qua các trường dữ liệu và xử lý tương ứng
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Xử lý các trường thông thường
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        System.out.println("Field Name: " + fieldName);
                        System.out.println("Field Value: " + fieldValue);

                        switch (fieldName) {
//                            case "productId":
//                                product.setProductId(fieldValue);
//                                System.out.println("Field Name: " + fieldName);
//                                System.out.println("Field Value: " + fieldValue);
//                                break;
                            case "storeId":
                                product.setStoreId(fieldValue);
                                break;
                            case "productName":
                                product.setProductName(new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8"));
                                break;
                            case "description":
                                product.setDescription(new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8"));
                                break;
                            case "price":
                                product.setPrice(BigDecimal.valueOf(Double.parseDouble(fieldValue)));
                                break;
                            case "quantity":
                                product.setQuantity(Integer.parseInt(fieldValue));
                                break;
                            case "categoryName":
                                product.setCategoryName(fieldValue);
                                System.out.println("Field Nameg: " + fieldName);
                                System.out.println("Field Valueg: " + fieldValue);
                                break;
                            case "status":
                                product.setStatus(fieldValue);
                                System.out.println("status" + fieldValue);
                                break;
                        }
                    } else {
                        // Xử lý trường hợp tạo sản phẩm với ảnh đính kèm
                        String fileName = item.getName();
                        if (fileName != null && !fileName.isEmpty()) {
                            String uploadPath = getServletContext().getRealPath("/") + "images/";

                            File file = new File(uploadPath, fileName);

                            // Kiểm tra xem tệp tin đã tồn tại trong thư mục hay không
                            if (file.exists()) {
                                // Xử lý trường hợp trùng lặp, ví dụ: đổi tên tệp tin
                                String baseName = FilenameUtils.getBaseName(fileName);
                                String extension = FilenameUtils.getExtension(fileName);
                                int counter = 1;

                                // Lặp để tạo tên mới cho tệp tin
                                while (file.exists()) {
                                    fileName = baseName + "_" + counter + "." + extension;
                                    file = new File(uploadPath, fileName);
                                    counter++;
                                }
                            }

                            item.write(file);
                            product.setImage("images/" + fileName);
                            System.out.println("d  " + fileName);
                        }

                    }

                }

                // Gọi phương thức DAO để tạo sản phẩm
                ProductDAO productDAO = new ProductDAO();
                boolean success = productDAO.createProduct(product);
                
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("userlogin");
                int userId = user.getUserId();

                // Get the storeId using userId
                StoreDAO storeDAO = new StoreDAO();

                // Lấy danh sách sản phẩm đã cập nhật
                List<ProductDTO> productList = productDAO.getAllProductsByStoreIdINT(userId);

                // Đặt productList là một thuộc tính trong session
               
                session.setAttribute("products", productList);
                // Đặt thông tin sản phẩm vừa tạo thành một thuộc tính riêng trong đối tượng yêu cầu (request)
                session.setAttribute("createdProduct", product);

                // Chuyển tiếp yêu cầu đến trang index.jsp
                request.getRequestDispatcher("createNewProduct.jsp").forward(request, response);

                // ...
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
