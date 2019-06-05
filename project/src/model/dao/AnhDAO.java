package model.dao;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import model.bean.AnhBEAN;

public class AnhDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public void UpLoadSingleFile(HttpServletRequest request) {
        final int MaxMemorySize = 1024*1024*3;//3MB
        
        final int MaxRequestSize = 1024*1024*50;//50MB
        final String address ="D:\\workspace\\QUANLYBAOHIEM_NHOM7\\View\\Anh";
        //hàm kiểm tra xem người lập trình đã cho thuộc tính enctype vào form hay chưa
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
        if(!isMultipart)
        {
            request.setAttribute("message", "Chưa bỏ enctype vào thím ơi");
        }
        
        // khởi tạo vùng nhớ tạm cho file
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        factory.setSizeThreshold(MaxMemorySize);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        
        // tạo ra File upload để upload file
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        // set max size mà file có thể upload được
        upload.setSizeMax(MaxRequestSize);
        
        
        try {
            //Chứa file vào 1 List
            List<FileItem> items = upload.parseRequest(request);
            
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
//            List<String> lsFilename = new ArrayList<>();
            
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (!item.isFormField())
                {
                     String fileName = item.getName();
//                     lsFilename.add(fileName);
    
                     String pathFile = address + File.separator +fileName;
                     
                     File uploadedFile = new File(pathFile);//chuyển file vào the đường dẫn path file
                     
                     boolean kt = uploadedFile.exists();//kiểm tra xem file upload đã tồn tại trước đó hay chưa
                     
                     
                     try {
                         if(kt)//nếu đã tồn tại thì thông báo
                         {
                             request.setAttribute("message","Hoàn thành việc chọn file !");
                             request.setAttribute("filename",fileName);    //lsFilename
                             //item.write(uploadedFile);
                         }
                         else
                         {
                              item.write(uploadedFile);
                              request.setAttribute("message","Hoàn thành việc chọn file !");     
                              request.setAttribute("filename",fileName);   
                         }
                        
                        
                    } catch (Exception e) {
                        if(e.getMessage()!=null)
                            request.setAttribute("message",e.getMessage());
                    }
                  
                } else 
                {
                    request.setAttribute("message","Upload Failed !");
                }
            }
            
        } catch (FileUploadException e) {
            if(e.getMessage()!=null)
                request.setAttribute("message",e.getMessage());
        }
    }

    public List<AnhBEAN> getListAnh() {
        List<AnhBEAN> dsAnh = new ArrayList<>();
        
        String sql = "SELECT * FROM ANH";
        try {
            
            con.getConnection();
            PreparedStatement cmd = con.connec.prepareStatement(sql);
            ResultSet rs = cmd.executeQuery();
            while(rs.next())
            {
                
              String maAnh = rs.getString("MaAnh");
              String path = rs.getString("Path");
              String maHS  = rs.getString("maHoSo");
              
              AnhBEAN gt = new AnhBEAN(maAnh, path, maHS);
              dsAnh.add(gt);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsAnh;
    }

    public int themAnh(String path, String idHoSo) throws SQLException {
        con.getConnection();
        String sql = "INSERT INTO Anh (MaAnh, Path, MaHoSo) VALUES (?,?,?)";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, "");
        cmd.setString(2, path);
        cmd.setString(3, idHoSo);
        
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public List<AnhBEAN> getListAnh(String idHoSo) throws SQLException {
        con.getConnection();
        String sql = "SELECT * FROM ANH WHERE MaHoSo = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, idHoSo);
        ResultSet rs = cmd.executeQuery();
        List<AnhBEAN> dsAnh = new ArrayList<AnhBEAN>();
        while(rs.next()){
            String maAnh = rs.getString("MaAnh");
            String path = rs.getString("Path");
            String maHS = rs.getString("MaHoSo");
            
            dsAnh.add(new AnhBEAN(maAnh, path, maHS));
        }
        
        rs.close();
        con.connec.close();
        return dsAnh;
    }

}
