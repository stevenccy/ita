package cn.oocl.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import cn.oocl.model.Product;

@Repository ("productDao")
public class ProductDaoImpl {

	// private EntityManagerFactory ef =
	// Persistence.createEntityManagerFactory("jpa");
	// // 不同的方法應該拥有自己的EntityManager,此處設置全局是因為方便
	// private EntityManager em = ef.createEntityManager();

	@PersistenceContext // 先 EntityManagerFactory,然後在從工廠中獲取 EntityManager
	private EntityManager em;

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#queryName(java.lang.String, int, int)
	 */
	public List<Product> queryName(String name, int currentPage, int size) {
		// 此時些的語句不是SQL而且 JPQL
		return em.createQuery("FROM Product p where p.name like :name", Product.class)
				.setParameter("name", "%" + name + "%").setFirstResult((currentPage - 1) * size) // 從第幾條記錄開始獲取
				.setMaxResults(size) // 獲取多條記錄
				.getResultList();
	}

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#queryByCid(java.lang.String)
	 */
	public List<Product> queryByCid(String cid) {
		return em.createQuery("From Product p where p.cid = :cid", Product.class).setParameter("cid", cid)
				.getResultList();
	}

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#queryByName(java.lang.String, int, int)
	 */
	@SuppressWarnings("unchecked")
	public List<Product> queryByName(String name, int currentPage, int size) {
		// 此時些的語句不是SQL而且 JPQL
		return em.createNativeQuery("select * from product p where p.name like ?", Product.class)
				.setParameter(1, "%" + name + "%").setFirstResult((currentPage - 1) * size) // 從第幾條記錄開始獲取
				.setMaxResults(size) // 獲取多條記錄
				.getResultList();
	}


	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#delete(java.lang.String)
	 */
	public void delete(String id) {
		// 先查詢,在刪除(刪除對象就等同於刪除記錄)
		em.remove(em.find(Product.class, id));
	}

	// 更新記錄本質就是更新對象(ORM映射機制)
	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#update(cn.oocl.model.Product)
	 */
	public void update(Product product) {
		em.merge(product);
	}

	// orm中,以後操作class就是操作table
	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.ProductDao#save(cn.oocl.model.Product)
	 */
}
