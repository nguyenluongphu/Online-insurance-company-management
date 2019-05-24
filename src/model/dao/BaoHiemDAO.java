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

import model.bean.BaoHiemBEAN;

public class BaoHiemDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public int countBaoHiem() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM BAOHIEM";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next()){
            count = rs.getInt(1);
        }
        rs.close();
        con.connec.close();
        return count;
    }
    
    public List<BaoHiemBEAN> getAllBaoHiem(int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM BAOHIEM ORDER BY MaBaoHiem OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setInt(1, pageid);
        cmd.setInt(2, count);
        ResultSet rs = cmd.executeQuery();
        List<BaoHiemBEAN> dsBaoHiem = new ArrayList<BaoHiemBEAN>();
        while(rs.next()){
            String maBaoHiem = rs.getString("MaBaoHiem");
            String loaiBaoHiem = rs.getString("LoaiBaoHiem");
            String moTa = rs.getString("MoTa");
            String anh = rs.getString("Anh");
            Integer mucDenBu = rs.getInt("MucDenBu");
            
            
            dsBaoHiem.add(new BaoHiemBEAN(maBaoHiem, loaiBaoHiem, moTa, anh, mucDenBu));
        }
        con.connec.close();
        rs.close();
        return dsBaoHiem;
    }
    
    public void UpLoadSingleFile(HttpServletRequest request) {
        final int MaxMemorySize = 1024*1024*3;//3MB
        
        final int MaxRequestSize = 1024*1024*50;//50MB
        final String address ="D:\\workspace\\QUANLYBAOHIEM_NHOM7\\View\\img";
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
    public String getMaBaoHiemMoi() throws SQLException {
        con.getConnection();
        String sql = "SELECT TOP 1 MaBaoHiem FROM dbo.BAOHIEM ORDER BY MaBaoHiem DESC";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        String maBH = "";
        if(rs.next()){
            maBH = rs.getString(1);
        }
        con.connec.close();
        return maBH;
        
    }
    

    public int themBaoHiem(String loaiBaoHiem, String moTa, Integer mucDenBu) throws SQLException {
        con.getConnection();
        String sql = "INSERT INTO BAOHIEM (MaBaoHiem, LoaiBaoHiem, MoTa, MucDenBu) VALUES (?,?,?,?)";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, "");
        cmd.setString(2, loaiBaoHiem);
        cmd.setString(3, moTa);
        cmd.setInt(4, mucDenBu);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int xoaBaoHiem(String id) throws SQLException {
        con.getConnection();
        String sql = "DELETE BAOHIEM WHERE MaBaoHiem = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int themAnh(String path, String maBaoHiem) throws SQLException {
        con.getConnection();
        String sql = "UPDATE BAOHIEM SET Anh = ? WHERE MaBaoHiem = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, path);
        cmd.setString(2, maBaoHiem);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }
    public BaoHiemBEAN getBaoHiem(String id) throws SQLException {
        con.getConnection();
        String sql = "SELECT * FROM BAOHIEM WHERE MaBaoHiem = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        ResultSet rs = cmd.executeQuery();
        BaoHiemBEAN baoHiemBEAN = null;
        if(rs.next()){
            String maBaoHiem = rs.getString("MaBaoHiem");
            String loaiBaoHiem = rs.getString("LoaiBaoHiem");
            String moTa = rs.getString("MoTa");
            String anh = rs.getString("Anh");
            
            Integer mucDenBu = rs.getInt("MucDenBu");
            
            baoHiemBEAN = new BaoHiemBEAN(maBaoHiem, loaiBaoHiem, moTa, anh, mucDenBu);
        }
        rs.close();
        con.connec.close();
        return baoHiemBEAN;
    }
    public int suaBaoHiem(String maBaoHiem, String loaiBaoHiem, String moTa) throws SQLException {
        con.getConnection();
        String sql = "UPDATE BAOHIEM SET LoaiBaoHiem = ?, MoTa = ? WHERE MaBaoHiem = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, loaiBaoHiem);
        cmd.setString(2, moTa);
        cmd.setString(3, maBaoHiem);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }
    //của Tỉnh
    public ArrayList<BaoHiemBEAN> getListBaoHiem(){
        String sql = " SELECT * FROM BAOHIEM";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<BaoHiemBEAN> list = new ArrayList<>();
            while(rs.next()) {
                BaoHiemBEAN bh = new BaoHiemBEAN();
                
                bh.setMaBaoHiem(rs.getString("MaBaoHiem"));
                bh.setLoaiBaoHiem(rs.getString("LoaiBaoHiem"));
                bh.setMoTa(rs.getString("MoTa"));
                bh.setAnh(rs.getString("Anh"));
                bh.setMucDenBu(rs.getInt("MucDenBu"));
                
                list.add(bh);
            }
            rs.close();
            con.connec.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<BaoHiemBEAN> getListBaoHiemByKey(String key){
        String sql = " SELECT * FROM dbo.BAOHIEM WHERE LoaiBaoHiem LIKE ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, "%"+key+"%");
            ResultSet rs = ps.executeQuery();
            ArrayList<BaoHiemBEAN> list = new ArrayList<>();
            while(rs.next()) {
                BaoHiemBEAN bh = new BaoHiemBEAN();
                
                bh.setMaBaoHiem(rs.getString("MaBaoHiem"));
                bh.setLoaiBaoHiem(rs.getString("LoaiBaoHiem"));
                bh.setMoTa(rs.getString("MoTa"));
                bh.setAnh(rs.getString("Anh"));
                bh.setMucDenBu(rs.getInt("MucDenBu"));
                
                list.add(bh);
            }
            rs.close();
            con.connec.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getLoaiBaoHiem(String maBaoHiem) {
        String sql = " SELECT LoaiBaoHiem FROM dbo.BAOHIEM WHERE MaBaoHiem = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, maBaoHiem);
            ResultSet rs = ps.executeQuery();
            String name = "";
            if (rs.next()) {
                name = rs.getString("LoaiBaoHiem");
                con.connec.close();
                return name;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
