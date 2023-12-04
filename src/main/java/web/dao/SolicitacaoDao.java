package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Solicitacao;

@Repository
public class SolicitacaoDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Solicitacao solicitacao) {
		manager.persist(solicitacao);
	}

	public void altera(Solicitacao solicitacao) {
		manager.merge(solicitacao);
	}

	public List<Solicitacao> lista() {
		return manager.createQuery("select c from Solicitacao c order by c.id desc", Solicitacao.class).getResultList();
	}

	public Solicitacao buscaPorId(Long id) {
		return manager.find(Solicitacao.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Solicitacao c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
