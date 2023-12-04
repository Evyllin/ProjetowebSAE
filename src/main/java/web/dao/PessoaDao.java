package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import web.modelo.Pessoa;

@Repository
public class PessoaDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Pessoa pessoa) {
		manager.persist(pessoa);
	}

	public void altera(Pessoa pessoa) {
		manager.merge(pessoa);
	}

	public List<Pessoa> lista() {
		return manager.createQuery("select c from Pessoa c order by c.id desc", Pessoa.class).getResultList();
	}

	public List<Pessoa> buscaPorNome(String nome) {
		return manager.createQuery("select c from Pessoa c where c.nome = :nome", Pessoa.class).setParameter("nome", nome)
				.getResultList();
	}

	public Pessoa buscaPorId(Long id) {
		return manager.find(Pessoa.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Pessoa c where c.id = :id").setParameter("id", id).executeUpdate();
	}
	
	public Pessoa buscaUltimaPessoaDiferente(Pessoa pessoaParametro) {
	    TypedQuery<Pessoa> query = manager.createQuery("SELECT p FROM Pessoa p ORDER BY p.id DESC", Pessoa.class);
	    query.setMaxResults(2);

	    List<Pessoa> ultimasPessoas = query.getResultList();

	    if (ultimasPessoas.size() == 1) {
	        return ultimasPessoas.get(0);
	    } else if (ultimasPessoas.size() >= 2) {
	        Pessoa ultimaPessoa = ultimasPessoas.get(0);
	        Pessoa penultimaPessoa = ultimasPessoas.get(1);

	        if (ultimaPessoa.getId().equals(pessoaParametro.getId())) {
	            return penultimaPessoa;
	        } else {
	            return ultimaPessoa;
	        }
	    } else {
	        return null;
	    }
	}

	

}
