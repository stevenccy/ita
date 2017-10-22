package cn.oocl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import cn.oocl.model.Category;
import cn.oocl.model.Product;

public class ProductDaoImpl extends BaseDaoImpl<Product> {

	public Product getById(String id) {
		String sql = "Select id,name,price,remark From Product_cheunst Where id = ?";
		return super.getById(sql, id, Product.class);
	}

	public int getPageCount(String keyword, int size) {
		String sql = "Select count(1) from product_cheunst where name LIKE ?";
		int recCount = super.getCount(sql, new Object[] { "%"+keyword+"%" });
		int pageCount = (int) Math.floor(recCount / size);
		if (recCount % size != 0) {
			return pageCount + 1;
		}
		return pageCount;
	}

	public List<Product> queryByCid(String cid){
		String sql = "select * from product_cheunst p join category_cheunst c on p.cid = c.id where cid = ?";
		//return super.queryByName(sql, Product.class, cid);
		return super.queryByName(sql, new Object[] { cid }, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs) throws SQLException {
				Product product = new Product();
				product.setId(rs.getString(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getBigDecimal(3));
				product.setRemark(rs.getString(4));
				product.setpdate(rs.getDate(5));
				product.setImgurl(rs.getString(7));
				Category category = new Category();
				category.setId(rs.getString(8));
				category.setName(rs.getString(9));
				product.setCategory(category);
				return product;
			}
		});
	}
	
	public List<Product> queryByNamePaging(String keyword, int currentPage, int size)
			throws InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException {
		String sql = "select t2.* from (select t1.*,rownum rn from (select * from product_cheunst p join category_cheunst c on p.cid = c.id where p.name like ?) t1 where rownum <=?) t2 where t2.rn>?";
		return super.queryByName(sql, new Object[] { "%" + keyword + "%", currentPage * size, (currentPage - 1) * size }, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs) throws SQLException {
				Product product = new Product();
				product.setId(rs.getString(1));
				product.setName(rs.getString(2));
				product.setPrice(rs.getBigDecimal(3));
				product.setRemark(rs.getString(4));
				product.setpdate(rs.getDate(5));
				Category category = new Category();
				category.setId(rs.getString(8));
				category.setName(rs.getString(9));
				product.setCategory(category);
				return product;
			}
		});
	}
	
	public List<Product> queryByName(String keyword){
		String sql = "Select name,id,price,remark,pdate From product_cheunst where name like ?";
		return super.queryByName(sql, Product.class, "%"+keyword+"%");
	}

	public int delete(int id) {
		String sql = "Delete from product_cheunst where id = ? ";
		return super.executeUpdate(sql, id);
	}

	public int update(Product product) {
		String sql = "Update product_cheunst set name = ?,price = ?, remark= ? where id = ? ";
		return super.executeUpdate(sql,
				new Object[] { product.getName(), product.getPrice(), product.getRemark(), product.getId() });
	}

	public int save(Product product) {
		String sql = "Insert into product_cheunst (name,price,remark) values (?,?,?)";
		return super.executeUpdate(sql, new Object[] { product.getName(), product.getPrice(), product.getRemark() });
	}

}