package cn.oocl.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Root;

import org.eclipse.persistence.internal.sessions.factories.model.pool.ConnectionPolicyConfig;
import org.eclipse.persistence.sessions.server.ConnectionPolicy;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.impl.CategoryServiceImpl;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

	@PersistenceContext
	private EntityManager em;

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.CategoryDao#save(cn.oocl.model.Category)
	 */
	@Override
	public void save(Category category) {
		em.persist(category);
	}

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.CategoryDao#queryAll()
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<Category> queryAll() {
		return em.createNativeQuery("Select * from category",Category.class).getResultList();
	}

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.CategoryDao#queryByHot(char)
	 */
	@Override
	public List<Category> queryByHot(char hot) {
		return em.createQuery("Select c From category c where c.hot=:hot", Category.class).setParameter("hot", hot)
				.getResultList();
	}

	/* (non-Javadoc)
	 * @see cn.oocl.dao.impl.CategoryDao#queryByCid(java.lang.String)
	 */
	@Override
	public Category queryByCid(String id) {
		return em.createQuery("FROM Category c where c.id =:id", Category.class).setParameter("id", id)
				.getSingleResult();
	}

	public static void main(String[] args) {

		Category category = new Category();
		category.setName("新插入類別");
		category.setHot('N');

		Product product = new Product();
		product.setName("級聯插入測試");
		product.setCategory(category);

		category.getProList().add(product);

		ApplicationContext context = new ClassPathXmlApplicationContext("spring-bean.xml");
		CategoryServiceImpl categoryService = context.getBean("categoryService", CategoryServiceImpl.class);

		categoryService.save(category);

	}
}
