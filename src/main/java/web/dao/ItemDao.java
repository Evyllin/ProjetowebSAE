package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Item;

@Repository
public class ItemDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Item item) {
		manager.persist(item);
	}

	public void altera(Item item) {
		manager.merge(item);
	}

	public List<Item> lista() {
		return manager.createQuery("select c from Item c order by c.id desc", Item.class).getResultList();
	}

	public List<Item> buscaPorNome(String nome) {
		return manager.createQuery("select c from Item c where c.nome = :nome", Item.class).setParameter("nome", nome)
				.getResultList();
	}

	public Item buscaPorId(Long id) {
		return manager.find(Item.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Item c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
