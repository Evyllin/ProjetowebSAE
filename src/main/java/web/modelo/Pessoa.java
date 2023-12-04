package web.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.NotNull;

@Entity
public class Pessoa {

	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "nome_do_seu_gerador")
    @SequenceGenerator(name = "nome_do_seu_gerador", sequenceName = "nome_da_sua_sequencia", allocationSize = 1)
	private Long id;

	@NotNull
	@Column(unique = true)
	private String nome;

	@NotNull
	private String email;

	private String telefone;

	@NotNull
	private String tipo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public String toString() {
		return "Pessoa [id=" + id + ", nome=" + nome + ", email=" + email + ", telefone=" + telefone + ", tipo=" + tipo
				+ "]";
	}

}
